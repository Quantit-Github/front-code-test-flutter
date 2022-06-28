import 'package:flutter/material.dart';
import 'package:todobooks/config/api.dart';
import 'package:todobooks/container/home/empty.dart';
import 'package:todobooks/model/task.dart';

import '../../color.dart';

class HomePageBody extends StatefulWidget {
  final ScrollController scroll;
  const HomePageBody({
    Key? key,
    required this.scroll,
  }) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final ValueNotifier<List<Task>> _active = ValueNotifier([]);
  final ValueNotifier<List<Task>> _done = ValueNotifier([]);
  final ValueNotifier<bool> _isError = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        await getSummery();
      } catch (e) {
        _isError.value = true;
      }
    });
  }

  Future<void> getSummery() async {
    Map<String, dynamic> _data = await ApiHandler().get("/api/summery/task");

    _active.value = List<Map<String, dynamic>>.from(_data['active'])
        .map<Task>((e) => Task.fromJson(e))
        .toList();
    _done.value = List<Map<String, dynamic>>.from(_data['done'])
        .map<Task>((e) => Task.fromJson(e))
        .toList();
    _isError.value = false;
  }

  Widget singleWidgetFor(Task task) {
    String name = task.task;
    TaskStatus status = task.status;
    TaskPriority priority = task.priority;

    return Container(
      alignment: Alignment.center,
      child: Text(name),
    );
  }

  Widget activeTasks() {
    return Container(
      child: Column(
        children: <Widget>[for (Task t in _active.value) singleWidgetFor(t)],
      ),
    );
  }

  Widget doneTasks() {
    return Container(
      child: Column(
        children: <Widget>[for (Task t in _done.value) singleWidgetFor(t)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isError,
      builder: (_, state, __) {
        if (state) {
          return EmptyMain(
            retry: getSummery,
            scroll: widget.scroll,
          );
        } else {
          var map = ColorMap();
          // TODO 2. Task Section 구현
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Active Tasks",
                  style: TextStyle(
                      color: map.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                activeTasks(),
                Spacer(),
                Text(
                  "Completed Tasks",
                  style: TextStyle(
                      color: map.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                doneTasks(),
                Spacer(),
              ],
            ),
          );
        }
      },
    );
  }
}

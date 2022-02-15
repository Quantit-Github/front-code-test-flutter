import 'package:flutter/material.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/components/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scroll = ScrollController();
  final ValueNotifier<bool> _elevation = ValueNotifier(false);

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _scroll.addListener(_elevationListner);
      _scroll.addListener(_scrollListener);
    });
    super.initState();
  }

  void _elevationListner() {
    final elevation = !(_scroll.offset <= _scroll.position.minScrollExtent &&
        !_scroll.position.outOfRange);
    debugPrint(elevation.toString());
    _elevation.value = elevation;
  }

  void _scrollListener() {
    if (_scroll.position.atEdge) {
      if (_scroll.position.pixels == 0) {
      } else {
        debugPrint("bottom hiit");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageHeader(
        titleWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Task books',
                style: TextStyle(
                  color: ColorMap().primary,
                ),
              ),
            ),
          ],
        ),
        elevation: _elevation,
        backgroundColor: Colors.white,
        preferredSize: const Size.fromHeight(54),
      ),
      body: CustomScrollView(
        controller: _scroll,
        slivers: const [],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/components/app_bar.dart';
import 'package:todobooks/config/routes.dart';
import 'package:todobooks/config/storage_manager.dart';
import 'package:todobooks/container/home/body.dart';

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

  logout() async {
    await PrefsManager.logout();
    Navigator.of(context).pushNamed(RouteEnum.login.path);
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
        actions: [
          TextButton(
            onPressed: logout,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorMap().primary),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: HomePageBody(scroll: _scroll),
    );
  }
}

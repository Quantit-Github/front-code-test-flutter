import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/config/routes.dart';
import 'package:todobooks/config/storage_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Future.delayed(const Duration(seconds: 3), () => login());
  }

  login() async {
    String? _token = await PrefsManager.readData("token");
    if (_token != null) {
      debugPrint("login");
    } else {
      Navigator.of(context).pushNamed(RouteEnum.login.path);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                "assets/logo.svg",
                height: 60,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                'Task books',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ColorMap().primary,
    );
  }
}

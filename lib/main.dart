import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/config/routes.dart';
import 'package:todobooks/controllers/testController.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitBinding(),
      scrollBehavior:
          const MaterialScrollBehavior().copyWith(scrollbars: false),
      title: 'Quantit Flutter Code Test',
      theme: ThemeData(
        primarySwatch: ColorMap().primary,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: mainRoutes,
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TestController>(TestController());
  }
}

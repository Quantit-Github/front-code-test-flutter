import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/config/routes.dart';
import 'package:todobooks/controller/login_controller.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controller/task_controller.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginController()),
          // ChangeNotifierProvider(create: (_) => TaskController()),
        ],
      child: MaterialApp(
        scrollBehavior:
        const MaterialScrollBehavior().copyWith(scrollbars: false),
        title: 'Quantit Flutter Code Test',
        theme: ThemeData(
          primarySwatch: ColorMap().primary,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: mainRoutes,
      ),
    );
  }
}

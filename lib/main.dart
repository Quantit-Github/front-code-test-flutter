import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/views/home.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior:
          const MaterialScrollBehavior().copyWith(scrollbars: false),
      title: 'Quantit Flutter Code Test',
      theme: ThemeData(
        primarySwatch: ColorMap().primary,
      ),
      home: const HomePage(),
    );
  }
}

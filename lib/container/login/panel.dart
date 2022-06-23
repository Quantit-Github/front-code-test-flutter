import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/components/input_filed.dart';
import 'package:todobooks/components/loading_text_button.dart';
import 'package:todobooks/config/routes.dart';
import 'package:todobooks/controller/login_controller.dart';
import 'package:todobooks/views/home.dart';
import 'package:http/http.dart' as http;

class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  _LoginPanelState createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO login panel 구현
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login', style: TextStyle(color: ColorMap().primary, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          TextInputField(
              controller: context.watch<LoginController>().emailController,
              isError: ValueNotifier(false),
            hintText: 'E-mail',
          ),
          TextInputField(
              controller: context.watch<LoginController>().passwordController,
              isError: ValueNotifier(false),
            hintText: 'Password',
          ),
          Container(
            width: 100,
            height: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorMap().gray,
              ),
                onPressed: () async{
                  await signIn().whenComplete(() {
                    Navigator.pushNamed(context, '/main');
                  });
                },
                child: Text('Login', style: TextStyle(color: Colors.black),)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account? '),
              TextButton(onPressed: () {}, child: const Text('Sign up'))
            ],
          ),
          buttonSns(),
          const SizedBox(height: 20,),
          buttonSnsButton()
        ],
      ),
    );
  }

  Widget buttonSns() {
    return Stack(
      children: [
        Divider(height: 30, thickness: 3, color: ColorMap().gray,),
        Center(
          child: Container(
            width: 90,
            color: Colors.white,
            child: Center(child: Text('SNS', style: TextStyle(color: ColorMap().gray, fontSize: 25, fontWeight: FontWeight.bold),)),
          ),
        ),
      ],
    );
  }

  Widget buttonSnsButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/facebook.svg'),
        SizedBox(width: 15,),
        SvgPicture.asset('assets/twitter.svg'),
      ],
    );
  }

  Future<void> signIn() async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ0MjA2MjUyLCJpYXQiOjE2NDQxOTU0NTEsImp0aSI6IjVlY2RmZTcwNjFhMTRiOTI4ZmQwMjk5ZjQyYjIyNzQyIiwidXNlcl9pZCI6MX0.s94cED5Jof_dnvMLDPWRmn8wBcr12jJ9A2JjpeIrzOg'));
    request.body = json.encode({
      "username": "admin",
      "password": "quantit4321"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}

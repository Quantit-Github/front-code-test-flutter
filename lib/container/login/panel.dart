import 'package:flutter/material.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/components/input_filed.dart';
import 'package:todobooks/config/api.dart';
import 'package:todobooks/config/routes.dart';
import 'package:todobooks/config/storage_manager.dart';
import 'package:todobooks/views/home.dart';

class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  _LoginPanelState createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier<bool> _loginSuccess = ValueNotifier<bool>(false);

  @override
  void dispose() {
    super.dispose();
  }

  Future attemptLogIn(String username, String password) async {
    return await ApiHandler()
        .post('/api/token', {username: username, password: password});
  }

  @override
  Widget build(BuildContext context) {
    // TODO login panel 구현
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Login',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: ColorMap().primary),
        ),
        const SizedBox(
          height: 20,
        ),
        TextInputField(
          controller: _usernameController,
          isError: _loginSuccess,
          hintText: 'Username',
        ),
        TextInputField(
          controller: _passwordController,
          isError: _loginSuccess,
          hintText: 'Password',
          obscureText: true,
        ),
        ElevatedButton(
            onPressed: () async {
              var username = _usernameController.text;
              var password = _passwordController.text;
              var jwt = await attemptLogIn(username, password);
              if (jwt != null) {
                _loginSuccess.value = true;
                PrefsManager.saveData('token', jwt);
                Navigator.of(context).pushNamed(RouteEnum.main.path);
                print('loggedin');
              } else {
                _loginSuccess.value = false;
                _loginSuccess.notifyListeners();
              }
            },
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 20),
            )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Don't have an account? "),
          TextButton(onPressed: () {}, child: const Text('Sign up')),
        ])
      ]),
    );
  }
}

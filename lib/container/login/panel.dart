import 'package:flutter/material.dart';
import 'package:todobooks/color.dart';
import 'package:todobooks/components/input_filed.dart';
import 'package:todobooks/components/loading_text_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todobooks/controller/login_controller/login_controller.dart';
import 'package:todobooks/controller/login_controller/login_state.dart';

import '../../config/routes.dart';

class LoginPanel extends ConsumerStatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  _LoginPanelState createState() => _LoginPanelState();
}

class _LoginPanelState extends ConsumerState<LoginPanel> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginController = ref.watch(loginProvider.notifier);
    final status =
        ref.watch(loginProvider.select((loginState) => loginState.loginStatus));

    ref.listen<LoginStatus>(
        loginProvider.select((loginState) => loginState.loginStatus),
        (LoginStatus? prev, LoginStatus next) {
      if (next == LoginStatus.success) {
        Navigator.of(context).pushNamed(RouteEnum.main.path);
      }
    });

    // TODO login panel 구현
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login",
            style: TextStyle(
              fontSize: 18,
              color: ColorMap().primary.shade600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextInputField(
            onChanged: (text) => loginController.onChangeEmail(text),
            controller: TextEditingController(),
            isError: ValueNotifier(false),
            hintText: "E-mail",
          ),
          const SizedBox(
            height: 20,
          ),
          TextInputField(
            onChanged: (text) => loginController.onChangePassword(text),
            controller: TextEditingController(),
            isError: ValueNotifier(false),
            hintText: "Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          LoadingTextButton(
            childDecoration:
                const BoxDecoration(color: Color.fromRGBO(206, 206, 206, 1)),
            child: status == LoginStatus.loading
                ? const CircularProgressIndicator()
                : const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
            enable: true,
            onPressed: () async {
              ref.read(loginProvider.notifier).loginWithEmail();
            },
          ),
        ],
      ),
    );
  }
}

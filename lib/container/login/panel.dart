import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todobooks/components/common_widgets.dart';
import 'package:todobooks/config/api.dart';
import 'package:todobooks/config/routes.dart';
import 'package:todobooks/config/storage_manager.dart';
import 'package:todobooks/global/strings.dart';
import 'package:todobooks/themes/colors.dart';
import 'package:todobooks/themes/font_styles.dart';

class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  _LoginPanelState createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO login panel 구현
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(GlobalString.login,
                  style: TextStyles.getDefaultFontStyle(
                    fontColor: CustomColor.color29A19C,
                    fontWeight: FontWeight.bold
                  )),
              CommonWidgets.heightSpace(height: 20.0),
              SizedBox(
                height: 39,
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    hintStyle: TextStyles.getDefaultFontStyle(fontSize: 14),
                    hintText: GlobalString.email
                ))
              ),
              CommonWidgets.heightSpace(height: 20.0),
              SizedBox(
                  height: 39,
                  child: TextField(
                    obscureText: true,
                    controller: pwController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      hintStyle: TextStyles.getDefaultFontStyle(fontSize: 14),
                      hintText: GlobalString.password
                  ))
              ),
              CommonWidgets.heightSpace(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: CustomColor.colorBtnGrey,
                  onPrimary: Colors.black,
                  textStyle: TextStyles.getDefaultFontStyle(fontSize: 16, fontWeight: FontWeight.bold)
                ),
                onPressed: () async {
                  Map<String, dynamic> _response;
                  await ApiHandler().post("/api/token", {"username": idController.text,
                       "password": pwController.text}).then((value) {
                         PrefsManager.saveData("token", value["access"]);
                         Navigator.of(context).pushNamed(RouteEnum.main.path);
                    });
                },
                child: const Text(GlobalString.login)
              ),
              CommonWidgets.heightSpace(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${GlobalString.dontHaveAccount} ', style: TextStyles.getDefaultFontStyle(fontSize: 12)),
                  InkWell(child: Text(GlobalString.signUp, style: TextStyles.getHyperlinkFontStyle(fontSize: 12)),)
                ]),
               CommonWidgets.heightSpace(height: 20.0),
              Row(
                children: [
                  Container(height: 0.5, width: 123.5, color: CustomColor.colorDarkBlue),
                  CommonWidgets.expander(),
                  Text(GlobalString.sns, style: TextStyles.getDefaultFontStyle(fontSize: 16, fontColor: CustomColor.colorDarkBlue)),
                  CommonWidgets.expander(),
                  Container(height: 0.5, width: 123.5, color: CustomColor.colorDarkBlue),
                ]),
              CommonWidgets.heightSpace(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/facebook.svg'
                    ),
                    onPressed: () {  },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                        'assets/twitter.svg'
                    ),
                    onPressed: () {  },
                  ),
                ]), // 2 button icons for fb, twitter
            ]));
  }
}

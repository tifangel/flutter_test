import 'package:flutter/material.dart';
import 'package:myflutterapp/utility/constants.dart';
import 'package:myflutterapp/providers/user_operations.dart';
import 'package:myflutterapp/screens/login/components/validatorGreeting.dart';
import 'package:myflutterapp/utility/validator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtUserEmailController = TextEditingController();
  var txtUserPwdController = TextEditingController();

  bool isErrorEmail = false;
  bool isErrorPwd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.only(bottom: defaultPadding * 4),
              child: Text(
                "Login".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            InputField(
              controller: txtUserEmailController,
              hintText: 'Email',
              typeAction: 'next',
              typeInput: 'email',
              isError: isErrorEmail,
              onChanged: (String value) {
                setState(() {
                  isErrorEmail = !Validator.validatorEmail.hasMatch(value);
                });
              },
            ),
            ValidatorGreeting(
                show: isErrorEmail, text: "Email tidak sesuai format"),
            InputField(
              controller: txtUserPwdController,
              hintText: 'Password',
              typeAction: 'done',
              typeInput: 'password',
              isError: isErrorPwd,
              onChanged: (String value) {
                setState(() {
                  isErrorPwd = !Validator.validatorPassword.hasMatch(value);
                });
              },
            ),
            ValidatorGreeting(
                show: isErrorPwd, text: "Password tidak sesuai format"),
            Container(
              padding: EdgeInsets.only(top: defaultPadding),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: isErrorEmail ||
                          isErrorPwd ||
                          txtUserEmailController.text.isEmpty ||
                          txtUserPwdController.text.isEmpty
                      ? null
                      : () async {
                          // Provider.of<UserOperation>(context, listen: false)
                          //     .signIn(txtUserEmailController.text,
                          //         txtUserPwdController.text);
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('email', txtUserEmailController.text);

                          print(txtUserEmailController.text);
                          print(txtUserPwdController.text);
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: bgColor, fontSize: 18),
                  ),
                  style: isErrorEmail ||
                          isErrorPwd ||
                          txtUserEmailController.text.isEmpty ||
                          txtUserPwdController.text.isEmpty
                      ? TextButton.styleFrom(
                          backgroundColor: secondaryColor,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          side: BorderSide(color: secondaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)))
                      : TextButton.styleFrom(
                          backgroundColor: accentColor,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          side: BorderSide(color: accentColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                ),
              ),
            ),
          ])),
    );
  }
}

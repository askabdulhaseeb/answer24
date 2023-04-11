import 'package:answer24/functions/url_funcation.dart';
import 'package:answer24/utilities/app_image.dart';
import 'package:answer24/utilities/custom_validator.dart';
import 'package:answer24/views/dashboard/dashboard_screen.dart';
import 'package:answer24/widgets/custom/custom_elevated_button.dart';
import 'package:answer24/widgets/custom/custom_textformfield.dart';
import 'package:answer24/widgets/custom/password_textformfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utilities/utilities.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String routeName = '/signin';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: key,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                child: Image.asset(AppImages.logo),
              ),
              CustomTextFormField(
                controller: _email,
                title: 'Email',
                validator: (value) => CustomValidator.email(value),
                keyboardType: TextInputType.emailAddress,
                hint: 'username@mail.com',
              ),
              PasswordTextFormField(controller: _password),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              CustomElevatedButton(
                title: 'Sign In',
                onTap: () {
                  if (key.currentState!.validate()) {
                    Navigator.of(context)
                        .pushReplacementNamed(DashboardScreen.routeName);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Theme.of(context).disabledColor),
                    children: [
                      const TextSpan(text: '''Don't have account? '''),
                      TextSpan(
                        text: 'Register here',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            try {
                              await UrlFuncation()
                                  .lunchStringURL(Utilities.signUpURL);
                            } catch (e) {
                              if (kDebugMode) {
                                print('SignIn View - Error: ${e.toString()}');
                              }
                            }
                          },
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

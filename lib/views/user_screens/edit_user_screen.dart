import 'package:answer24/models/app_user.dart';
import 'package:answer24/utilities/custom_validator.dart';
import 'package:answer24/widgets/custom/custom_elevated_button.dart';
import 'package:answer24/widgets/custom/custom_textformfield.dart';
import 'package:answer24/widgets/custom/password_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});
  static const String routeName = '/edit-user';

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController _fName;
  late TextEditingController _lName;
  late TextEditingController _username;
  final TextEditingController _password =
      TextEditingController(text: 'Password');
  final TextEditingController _confirmPassword =
      TextEditingController(text: 'Password');
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final AppUser user = AppUser();
    _fName = TextEditingController(text: user.firstName);
    _lName = TextEditingController(text: user.lastName);
    _username = TextEditingController(text: user.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Icon(
                CupertinoIcons.person_alt_circle,
                size: 120,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 24),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextFormField(
                      controller: _fName,
                      title: 'First Name'.toUpperCase(),
                      readOnly: isLoading,
                      showSuffixIcon: !isLoading,
                      validator: (value) => CustomValidator.lessThen3(value),
                      keyboardType: TextInputType.name,
                      autoFocus: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _lName,
                      title: 'Last Name'.toUpperCase(),
                      readOnly: isLoading,
                      showSuffixIcon: !isLoading,
                      validator: (value) => CustomValidator.lessThen3(value),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              CustomTextFormField(
                controller: _username,
                title: 'USERNAME'.toUpperCase(),
                readOnly: isLoading,
                validator: (value) => CustomValidator.lessThen5(value),
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    '@email.com',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              PasswordTextFormField(
                controller: _password,
                title: 'PASSWORD',
                textInputAction: TextInputAction.next,
              ),
              PasswordTextFormField(
                controller: _confirmPassword,
                title: 'CONFIRM PASSWORD',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: CustomElevatedButton(
                  title: 'SIGN UP',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

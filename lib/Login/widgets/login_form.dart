// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:parchi_app/All_tickets/All_tickets.dart';
import 'package:parchi_app/constants/Assets.dart';
import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/sized_box.dart';
import 'package:parchi_app/constants/text_theme.dart';

import '../../../../Widgets/custom_button.dart';
import '../../../../Widgets/custom_textfields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: parchiColorTheme().darkgreen,
                  ),
                  SizedBoxes.horizontal10Px,
                  Text(
                    "Return",
                    style: parchiTextTheme().body.copyWith(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: parchiColorTheme().darkgreen,
                        ),
                  ),
                ],
              ),
            ),
            SizedBoxes.vertical26Px,
            Text(
              "Welcome Back!",
              style: parchiTextTheme().heading3.copyWith(
                    color: parchiColorTheme().darkgreen,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Satoshi',
                  ),
            ),
            SizedBoxes.vertical26Px,
            CustomTextField(
              controller: emailController,
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: "Email Address",
              validator: validateEmail,
              labelStyle: parchiTextTheme().body.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Satoshi',
                  ),
              filled: true,
              fillColor: const Color.fromARGB(153, 255, 255, 255),
            ),
            SizedBoxes.verticalMedium,
            CustomTextField(
              controller: passwordController,
              prefixIcon: Image.asset(
                parchiAssets.pwdicon,
                height: 8,
                width: 8,
              ),
              filled: true,
              fillColor: const Color.fromARGB(153, 255, 255, 255),
              labelText: "Password",
              obscureText: true,
              validator: validatePassword,
              labelStyle: parchiTextTheme().body.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Satoshi',
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    'Forgot Password?',
                    style: parchiTextTheme().subtext.copyWith(
                          fontFamily: 'Satoshi',
                          color: parchiColorTheme().darkgreen,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.5,
                        ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBoxes.verticalBig,
            Center(
              child: CustomButton(
                  width: 254,
                  text: "Sign In",
                  color: parchiColorTheme().darkgreen,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllEventScreen(),
                      ),
                    );
                  }),
            ),
            SizedBoxes.verticalBig,
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: parchiTextTheme().subtext.copyWith(
                        fontSize: 14,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w400,
                        color: parchiColorTheme().darkgreen,
                      ),
                  children: const [
                    TextSpan(
                      text: "By Clicking “Sign In”, you agree to our ",
                    ),
                    TextSpan(
                      text: "Terms of Use",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final String email = emailController.text;
      final String password = passwordController.text;
      // final userProvider = Provider.of<UserProvider>(context, listen: false);

      // await userProvider.login(email, password);

      // if (userProvider.status == 'success') {
      //   Navigator.of(context).pushReplacementNamed('/home');
      // } else if (userProvider.status == 'error') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: parchiColorTheme().black,
            content: Row(
              children: [
                Icon(
                  Icons.error,
                  color: parchiColorTheme().darkgreen,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '    Incorrect Email or\n        Password',
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        color: parchiColorTheme().white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Center(
                child: CustomButton(
                  text: 'Try Again',
                  color: parchiColorTheme().darkgreen,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  width: double.infinity,
                ),
              ),
            ],
          );
        },
      );
    }
  }
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  } else if (!value.contains('@')) {
    return 'Invalid email format';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  return null;
}

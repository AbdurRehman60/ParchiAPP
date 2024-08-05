// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parchi_app/Widgets/custom_button.dart';
import 'package:parchi_app/Widgets/custom_textfields.dart';
import 'package:parchi_app/constants/Assets.dart';
import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/sized_box.dart';
import 'package:parchi_app/constants/text_theme.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22),
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
                        color: parchiColorTheme().darkgreen),
                  ),
                ],
              ),
            ),
            SizedBoxes.vertical26Px,
            Text(
              "Let's Get Started*",
              style: parchiTextTheme().heading3.copyWith(
                  color: parchiColorTheme().darkgreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Satoshi'),
            ),
            SizedBoxes.vertical26Px,
            CustomTextField(
              controller: emailController,
              filled: true,
              fillColor: const Color.fromARGB(153, 255, 255, 255),
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: "Email Address",
              validator: (value) => validateEmail(value),
              labelStyle: parchiTextTheme().body.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Satoshi'),
            ),
            SizedBoxes.verticalBig,
            CustomTextField(
              filled: true,
              fillColor: const Color.fromARGB(153, 255, 255, 255),
              controller: passwordController,
              prefixIcon: Image.asset(
                parchiAssets.pwdicon,
                height: 8,
                width: 8,
              ),
              labelText: "Password",
              obscureText: true,
              validator: validatePassword,
              labelStyle: parchiTextTheme().body.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Satoshi'),
            ),
            SizedBoxes.verticalBig,
            CustomTextField(
              filled: true,
              fillColor: const Color.fromARGB(153, 255, 255, 255),
              controller: confirmPasswordController,
              prefixIcon: Image.asset(
                parchiAssets.pwdicon,
                height: 8,
                width: 8,
              ),
              labelText: "Confirm Password",
              obscureText: true,
              validator: validatePassword,
              labelStyle: parchiTextTheme().body.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Satoshi'),
            ),
            SizedBoxes.verticalBig,
            Center(
                child: CustomButton(
                    width: 254,
                    text: "Continue",
                    color: parchiColorTheme().darkgreen,
                    onPressed: () {})
                // child: Consumer<UserProvider>(
                //   builder: (context, userProvider, child) {
                //     return CustomButton(
                //       width: 254,
                //       text: "Continue",
                //       color:parchiColorTheme().darkgreen,
                //       onPressed: () => onSignUpPressed(userProvider),
                //     );
                //   },
                // ),
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
                children: [
                  const TextSpan(
                    text: "By Clicking “Continue”, you agree to our ",
                  ),
                  TextSpan(
                    text: "Terms of Use",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const TermsAndUseScreen()));
                      },
                  ),
                  const TextSpan(
                    text: " and ",
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const PrivacyPolicyScreen()));
                      },
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!value.contains('@') || !value.contains('com')) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (value != confirmPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Future<void> onSignUpPressed(UserProvider userProvider) async {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     await userProvider.register(
  //       emailController.text,
  //       passwordController.text,
  //     );
  //     final message = userProvider.message;
  //     if (userProvider.status == 'otp_sent') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(message)),
  //       );
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) =>
  //               EmailVerification(email: emailController.text),
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(message)),
  //       );
  //     }
  //   }
  // }
}

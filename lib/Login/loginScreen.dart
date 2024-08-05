import 'package:flutter/material.dart';
import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/sized_box.dart';
import 'package:parchi_app/constants/text_theme.dart';
import 'package:parchi_app/Login/widgets/login_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: parchiColorTheme().tracesofember,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                color: parchiColorTheme().greenwhatsap,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(214, 255, 206, 0.067),
                    offset: Offset(0, 107),
                    blurRadius: 43,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(214, 255, 206, 0.067),
                    offset: Offset(0, 107),
                    blurRadius: 43,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(214, 255, 206, 0.067),
                    offset: Offset(0, 107),
                    blurRadius: 43,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(214, 255, 206, 0.067),
                    offset: Offset(0, 107),
                    blurRadius: 43,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(214, 255, 206, 0.067),
                    offset: Offset(0, 107),
                    blurRadius: 43,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Never Lose Track of Any",
                    style: parchiTextTheme().heading3.copyWith(
                        fontFamily: 'Satoshi',
                        color: parchiColorTheme().richegreen,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        letterSpacing: -0.96),
                  ),
                  SizedBoxes.vertical26Px,
                  // Image.asset(MajlisAssets.majlisapplogo),
                ],
              ),
            ),
            SizedBoxes.vertical15Px,
            const LoginForm()
          ],
        ),
      ),
    );
  }
}

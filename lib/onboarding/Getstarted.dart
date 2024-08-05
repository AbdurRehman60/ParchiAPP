import 'package:flutter/material.dart';
import 'package:parchi_app/Login/loginScreen.dart';
import 'package:parchi_app/Widgets/or_divider.dart';
import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/sized_box.dart';
import 'package:parchi_app/constants/text_theme.dart';
import 'package:parchi_app/onboarding/onboardingone.dart';
import 'package:parchi_app/widgets/custom_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: parchiColorTheme().tracesofember,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 299,
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
                      "Welcome to",
                      style: parchiTextTheme().heading3.copyWith(
                          fontFamily: 'Satoshi',
                          color: parchiColorTheme().richegreen,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          letterSpacing: -0.96),
                    ),
                    SizedBoxes.vertical26Px,
                    // Image.asset(""),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Stay updated on  events with ticking, offering details of ticking across the US.",
                  style: parchiTextTheme().body.copyWith(
                      fontFamily: 'Satoshi',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: parchiColorTheme().darkgreen,
                      height: 1.5),
                ),
              ),
              SizedBoxes.vertical15Px,
              CustomButton(
                width: 254,
                text: "Get Started",
                color: parchiColorTheme().darkgreen,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingOne(),
                    ),
                  );
                },
                elevation: 20,
              ),
              SizedBoxes.vertical15Px,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 78.0),
                child: OrDivider(),
              ),
              SizedBoxes.vertical15Px,
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(12),
                child: CustomButton(
                  width: 254,
                  text: "Sign In to Exisiting Account",
                  color: parchiColorTheme().tracesofember,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  textColor: parchiColorTheme().dark1green,
                  elevation: 20,
                ),
              ),
              SizedBoxes.vertical10Px,
            ],
          ),
        ],
      ),
    );
  }
}

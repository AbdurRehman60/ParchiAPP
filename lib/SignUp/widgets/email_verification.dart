// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:parchi_app/All_tickets/All_tickets.dart';
import 'package:parchi_app/Widgets/custom_button.dart';

import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/sized_box.dart';
import 'package:parchi_app/constants/text_theme.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key, required this.email});

  final String email;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleInput(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  // Future<void> onVerifyPressed(UserProvider userProvider) async {
  //   String otp = _controllers.map((e) => e.text).join();
  //   await userProvider.verifyOTP(userProvider.id!.userDetails.id, otp);
  //   final message = userProvider.message;
  //   if (userProvider.status == 'verified') {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(message)),
  //     );
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const OnboardingOne(),
  //       ),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(message)),
  //     );
  //   }
  // }

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
                ],
              ),
            ),
            SizedBoxes.vertical26Px,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Verification",
                    style: parchiTextTheme().heading3.copyWith(
                          color: parchiColorTheme().darkgreen,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Satoshi',
                        ),
                  ),
                  SizedBoxes.vertical26Px,
                  Text(
                    "Enter the 4-digit OTP (One-Time Password) that we have sent to ${widget.email}",
                    style: parchiTextTheme().subtext.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: parchiColorTheme().darkgreen),
                  ),
                  SizedBoxes.vertical26Px,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border(
                                    bottom: BorderSide(
                                  color: parchiColorTheme().richegreen,
                                  width: 1,
                                ))),
                            width: 50,
                            height: 50,
                            child: Material(
                              elevation: 6,
                              borderRadius: BorderRadius.circular(5),
                              child: TextFormField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: parchiTextTheme().heading3.copyWith(
                                      color: parchiColorTheme().darkgreen,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Satoshi',
                                    ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: parchiColorTheme().richegreen,
                                        width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: parchiColorTheme().richegreen,
                                        width: 2),
                                  ),
                                ),
                                onChanged: (value) =>
                                    _handleInput(value, index),
                              ),
                            ),
                          ),
                          if (index < 3) const SizedBox(width: 20),
                        ],
                      );
                    }),
                  ),
                  SizedBoxes.vertical26Px,
                  Center(
                      child: CustomButton(
                    width: 254,
                    text: "Verify",
                    color: parchiColorTheme().darkgreen,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllEventScreen(),
                        ),
                      );
                    },
                  )
                      // child: Consumer<UserProvider>(
                      //   builder: (context, userProvider, child) {
                      //     return CustomButton(
                      //       width: 254,
                      //       text: "Verify",
                      //       color: MajlisColorTheme().darkred,
                      //       onPressed: () => onVerifyPressed(userProvider),
                      //     );
                      //   },
                      // ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

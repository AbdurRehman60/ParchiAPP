import 'package:flutter/material.dart';
import 'package:parchi_app/SignUp/widgets/email_verification.dart';
import 'package:parchi_app/Widgets/custom_button.dart';
import 'package:parchi_app/Widgets/custom_textfields.dart';
import 'package:parchi_app/constants/Assets.dart';
import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/sized_box.dart';
import 'package:parchi_app/constants/text_theme.dart';

class OnboardingOneForm extends StatefulWidget {
  const OnboardingOneForm({super.key});

  @override
  State<OnboardingOneForm> createState() => _OnboardingOneFormState();
}

class _OnboardingOneFormState extends State<OnboardingOneForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  String? _selectedGender;
  String? _selectedLang;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Some More Details",
              style: parchiTextTheme().heading3.copyWith(
                  color: parchiColorTheme().darkgreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Satoshi'),
            ),
            SizedBoxes.vertical26Px,
            CustomTextField(
              controller: fullNameController,
              labelText: "Full Name",
              labelStyle: parchiTextTheme().body.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Satoshi'),
              filled: true,
              fillColor: const Color.fromARGB(153, 255, 255, 255),
              prefixIcon: Image.asset(
                parchiAssets.account,
                width: 8,
                height: 8,
              ),
              validator: validateFullName,
            ),
            SizedBoxes.vertical26Px,
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              child: SizedBox(
                height: 48,
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    labelText: '--Select Gender--*',
                    labelStyle: parchiTextTheme().body.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Satoshi'),
                    prefixIcon: Image.asset(
                      parchiAssets.gender,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: parchiColorTheme().white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: parchiColorTheme().black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(153, 255, 255, 255),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Gender is required' : null,
                ),
              ),
            ),
            SizedBoxes.vertical15Px,
            Text(
              "This allows us to show you Majalis according to your gender.",
              style: parchiTextTheme().body.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Satoshi'),
            ),
            SizedBoxes.vertical26Px,
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              child: SizedBox(
                height: 48,
                child: DropdownButtonFormField<String>(
                  value: _selectedLang,
                  decoration: InputDecoration(
                    labelText: '--Select Preferred Language--*',
                    labelStyle: parchiTextTheme().body.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Satoshi'),
                    prefixIcon: Image.asset(
                      parchiAssets.language,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: parchiColorTheme().white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: parchiColorTheme().black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(153, 255, 255, 255),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  items: ['English', 'Urdu', "Hindi"]
                      .map((language) => DropdownMenuItem<String>(
                            value: language,
                            child: Text(language),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLang = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Language is required' : null,
                ),
              ),
            ),
            SizedBoxes.vertical15Px,
            Text(
              "This way, we can show you Majalis, in your preferred language.",
              style: parchiTextTheme().body.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Satoshi'),
            ),
            SizedBoxes.vertical26Px,
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 48,
                child: TextFormField(
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number (Optional)',
                    labelStyle: parchiTextTheme().body.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Satoshi'),
                    prefixIcon: const Icon(Icons.local_phone_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: parchiColorTheme().white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: parchiColorTheme().black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(153, 255, 255, 255),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBoxes.vertical26Px,
            Center(
              child: CustomButton(
                width: 254,
                text: "Sign Up",
                color: parchiColorTheme().darkgreen,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailVerification(
                          email: '',
                        ),
                      ),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => OnboardingLast(
                    //       name: fullNameController.text,
                    //       gender: _selectedGender!,
                    //       preferredLanguage: _selectedLang!,
                    //       phoneNumber: contactController.text.isEmpty
                    //           ? null
                    //           : contactController.text,
                    //     ),
                    //   ),
                    // );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/sized_box.dart';
import 'package:parchi_app/constants/text_theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Divider(
              color: parchiColorTheme().black,
              thickness: 1.5,
            ),
          ),
        ),
        SizedBoxes.horizontalMicro,
        Text('or',
            style: parchiTextTheme().heading6.copyWith(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w500,
                color: parchiColorTheme().darkgreen,
                fontSize: 15)),
        SizedBoxes.horizontalMicro,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Divider(
              color: parchiColorTheme().black,
              thickness: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

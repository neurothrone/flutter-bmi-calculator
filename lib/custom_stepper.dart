import 'package:flutter/material.dart';

import 'constants.dart';
import 'round_icon_button.dart';

class CustomStepper extends StatelessWidget {
  final String label;
  final int value;
  final int minValue;
  final int maxValue;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  const CustomStepper({
    Key? key,
    required this.label,
    required this.value,
    required this.minValue,
    required this.maxValue,
    this.onDecrement,
    this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label.toUpperCase(),
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kProminentTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: onDecrement,
              enabled: value > minValue,
              icon: Icons.remove,
            ),
            const SizedBox(
              width: kElementPadding,
            ),
            RoundIconButton(
              onPressed: onIncrement,
              enabled: value < maxValue,
              icon: Icons.add,
            ),
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final bool enabled;

  const RoundIconButton(
      {Key? key,
        required this.onPressed,
        required this.icon,
        this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: enabled ? onPressed : null,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      elevation: 6.0,
      disabledElevation: 0.0,
      shape: const CircleBorder(),
      fillColor: enabled ? kRoundButtonColor : Colors.grey.shade700,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function()? onTapped;

  const ReusableCard({
    super.key,
    required this.color,
    required this.cardChild,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                const BorderRadius.all(Radius.circular(kElementPadding))),
        height: 200,
        child: cardChild,
      ),
    );
  }
}

import 'package:bmi_calculator/calculator_view_model.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final double bmi;
  final String bmiResult;
  final String bmiInterpretation;

  const ResultsPage({
    Key? key,
    required this.bmi,
    required this.bmiResult,
    required this.bmiInterpretation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          // !: Title
          const Text(
            "Your Result",
            style: kProminentTextStyle,
          ),
          // !: Container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kElementPadding),
              child: ReusableCard(
                color: kCardBackground,
                cardChild: Padding(
                  padding: const EdgeInsets.all(kElementPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiResult.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: kBmiTextStyle,
                      ),
                      Text(
                        bmiInterpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // !: Re-calculate
          Padding(
            padding: const EdgeInsets.only(bottom: kElementPadding),
            child: BottomButton(
              label: "Re-calculate".toUpperCase(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

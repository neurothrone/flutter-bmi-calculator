import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_view_model.dart';
import '../constants.dart';
import '../gender.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import '../components/custom_stepper.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var viewModel = CalculatorViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BMI Calculator")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: kElementPadding),
        child: Column(
          children: [
            // !: Gender
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kElementPadding),
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onTapped: () {
                        setState(() {
                          viewModel.selectedGender = Gender.male;
                        });
                      },
                      color: viewModel.selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: kElementPadding,
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTapped: () {
                        setState(() {
                          viewModel.selectedGender = Gender.female;
                        });
                      },
                      color: viewModel.selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // !: Height
            Padding(
              padding: const EdgeInsets.all(kElementPadding),
              child: ReusableCard(
                color: kCardBackground,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height".toUpperCase(),
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          viewModel.height.toString(),
                          style: kProminentTextStyle,
                        ),
                        const Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: kTextColor,
                        thumbColor: kBottomContainerColor,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayColor: kBottomContainerColor.withOpacity(0.19),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        value: viewModel.height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            viewModel.height = newValue.round();
                          });
                        },
                        min: kMinSliderValue,
                        max: kMaxSliderValue,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // !: Weight & Age
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kElementPadding),
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kCardBackground,
                      cardChild: CustomStepper(
                          label: "Weight",
                          value: viewModel.weight,
                          minValue: kMinWeight,
                          maxValue: kMaxWeight,
                          onDecrement: () {
                            setState(() {
                              viewModel.weight -= 1;
                            });
                          },
                          onIncrement: () {
                            setState(() {
                              viewModel.weight += 1;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(
                    width: kElementPadding,
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kCardBackground,
                      cardChild: CustomStepper(
                        label: "Age",
                        value: viewModel.age,
                        minValue: kMinAge,
                        maxValue: kMaxAge,
                        onDecrement: () {
                          setState(() {
                            viewModel.age -= 1;
                          });
                        },
                        onIncrement: () {
                          setState(() {
                            viewModel.age += 1;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // !: Calculate
            BottomButton(
              label: "Calculate".toUpperCase(),
              onPressed: () {
                viewModel.calculateBMI();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: viewModel.bmi,
                      bmiResult: viewModel.bmiResult,
                      bmiInterpretation: viewModel.bmiInterpretation,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

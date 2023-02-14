import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'custom_stepper.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 183;
  int weight = 74;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
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
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
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
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
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
                          height.toString(),
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
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
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
                          value: weight,
                          minValue: kMinWeight,
                          maxValue: kMaxWeight,
                          onDecrement: () {
                            setState(() {
                              weight -= 1;
                            });
                          },
                          onIncrement: () {
                            setState(() {
                              weight += 1;
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
                        value: age,
                        minValue: kMinAge,
                        maxValue: kMaxAge,
                        onDecrement: () {
                          setState(() {
                            age -= 1;
                          });
                        },
                        onIncrement: () {
                          setState(() {
                            age += 1;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // !: Calculate
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kElementPadding),
              child: Container(
                decoration: const BoxDecoration(
                    color: kBottomContainerColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kElementPadding))),
                margin: const EdgeInsets.only(top: kElementPadding),
                width: double.infinity,
                height: kBottomContainerHeight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Calculate",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


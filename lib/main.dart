import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: false).copyWith(
        primaryColor: kCardBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryBackgroundColor,
        ),
        scaffoldBackgroundColor: kPrimaryBackgroundColor,
      ),
      home: const InputPage(),
    );
  }
}

import 'package:flutter/material.dart';

import 'constants.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: false).copyWith(
        primaryColor: kCardBackground,
        appBarTheme: AppBarTheme(
          backgroundColor: kCardBackground,
        ),
        scaffoldBackgroundColor: kPrimaryBackgroundColor,
      ),
      home: InputPage(),
    );
  }
}

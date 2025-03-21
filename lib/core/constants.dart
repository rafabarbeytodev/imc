import 'package:flutter/material.dart';
import 'package:imc/data/imc_result.dart';

class Constants {

  static const int genderMale = 0;
  static const int genderFemale = 1;

  static const double heightMin = 120;
  static const double heightMax = 220;
  static const double heightInitial = 170;
  static const double weightInitial = 80;
  static const double edgeInitial = 20;
  static const double edgeMax = 150;

  static final imcResultLow = ImcResult(
    color: Colors.blue,
    title: "LOW",
    description: "Your weight is below normal. Consider consulting a healthcare provider.",
  );

  static final imcResultNormal = ImcResult(
    color: Colors.green,
    title: "NORMAL",
    description: "You have a normal body weight. Good job!",
  );

  static final imcResultOverWeight = ImcResult(
    color: Colors.orange,
    title: "OVERWEIGHT",
    description: "You are slightly overweight. Consider a balanced diet and exercise.",
  );

  static final imcResultObesity = ImcResult(
    color: Colors.green,
    title: "OBESITY",
    description: "You are in the obesity range. Consult a healthcare provider for advice.",
  );

}

import 'package:flutter/material.dart';
import 'package:imc/components/gender_selector.dart';
import 'package:imc/components/height_selector.dart';
import 'package:imc/components/number_selector.dart';
import 'package:imc/core/app_color.dart';
import 'package:imc/core/constants.dart';
import 'package:imc/core/text_styles.dart';
import 'package:imc/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  bool selectedMale = true;
  bool selectedFemale = false;
  int selectedEdge = Constants.edgeInitial.toInt();
  int selectedWeight = Constants.weightInitial.toInt();
  int selectedHeight = Constants.heightInitial.toInt();
  int selectedGender = Constants.genderMale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toolbarHome(),
      backgroundColor: AppColors.background,
      body: bodyHome(context),
    );
  }

  Column bodyHome(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            top: 16,
            bottom: 16,
            right: 8,
          ),
          child: Row(
            children: [
              GenderSelector(
                gender: "Men",
                image: "assets/images/male.png",
                selectedGender: selectedMale,
                onPressed: (int value, String message) {
                  setState(() {
                    selectedMale = !selectedMale;
                    selectedFemale = !selectedMale;
                    selectedMale == true
                        ? selectedGender = Constants.genderMale
                        : selectedGender = Constants.genderFemale;
                  });
                },
              ),
              GenderSelector(
                gender: "Women",
                image: "assets/images/female.png",
                selectedGender: selectedFemale,
                onPressed: (int value, String message) {
                  setState(() {
                    selectedFemale = !selectedFemale;
                    selectedMale = !selectedFemale;
                    selectedMale == true
                        ? selectedGender = Constants.genderMale
                        : selectedGender = Constants.genderFemale;
                  });
                },
              ),
            ],
          ),
        ),
        HeightSelector(
          onChange: (int heightSelected) {
            setState(() {
              selectedHeight = heightSelected;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "PESO",
                  value: selectedWeight,
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (selectedWeight > 0) selectedWeight--;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "EDAD",
                  value: selectedEdge,
                  onIncrement: () {
                    setState(() {
                      if (selectedEdge < Constants.edgeMax) selectedEdge++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (selectedEdge > 0) selectedEdge--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ImcResultScreen(
                          height: selectedHeight,
                          weight: selectedWeight,
                          edge: selectedEdge,
                        ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("CALCULAR", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}

AppBar toolbarHome() {
  return AppBar(
    title: Text('IMC Calculator'),
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  );
}

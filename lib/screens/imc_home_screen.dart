import 'package:flutter/material.dart';
import 'package:imc/components/gender_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {

  bool selectedMale = true;
  bool selectedFemale = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
          GenderSelector(gender: "Men", image: "assets/images/male.png", selectedGender: selectedMale,onPressed: () {
            setState(() {
              selectedMale = !selectedMale;
              selectedFemale = !selectedMale;
            });
          }),  
          GenderSelector(gender: "Women", image: "assets/images/female.png", selectedGender: selectedFemale,onPressed: () {
            setState(() {
              selectedFemale = !selectedFemale;
              selectedMale = !selectedFemale;
            });
          }), 
      ])
      ],
    );
  }
}
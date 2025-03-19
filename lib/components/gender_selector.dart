import 'package:flutter/material.dart';
import 'package:imc/core/app_color.dart';
import 'package:imc/core/constants.dart';
import 'package:imc/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  int? selectedGender;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hombre
        Expanded(
          child: GestureDetector( onTap: (){
            setState(() {
              selectedGender = Constants.male;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left:16,top:16,bottom:16, right:8),
            child: Container(
              decoration: BoxDecoration(
                color: selectedGender == Constants.male ? 
                AppColors.backgroundComponentSelected:  
                AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image.asset("assets/images/male.png",height: 100),
                    SizedBox(height: 10),
                    Text("Men".toUpperCase(), 
                    style: TextStyles.bodyText)
                  ],
                ),
              ),
            ),
          )
          ),
        ),
        //Mujer
        Expanded(
          child: GestureDetector( onTap: (){
            setState(() {
              selectedGender = Constants.female;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left:8,top:16,bottom:16, right:16),
            child: Container(
              decoration: BoxDecoration(
                color: selectedGender == Constants.female ? 
                AppColors.backgroundComponentSelected:  
                AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image.asset("assets/images/female.png",height: 100),
                    SizedBox(height: 10),
                    Text("Women".toUpperCase(), 
                    style: TextStyles.bodyText)
                  ],
                ),
              ),
            ),
          ),
        )
        ),
      ],
    );
  }
}
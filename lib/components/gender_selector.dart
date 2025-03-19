import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:imc/core/app_color.dart';
import 'package:imc/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({
  super.key, 
  required this.gender, 
  required this.image, 
  required this.selectedGender, 
  required this.onPressed});
  
  final String gender;
  final String image;
  final bool? selectedGender;
  final VoidCallback onPressed;

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}
  
class _GenderSelectorState extends State<GenderSelector> {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector( onTap: (){
        log("prueba",name: "RAFADEVELOP");
        widget.onPressed();
      },
          child: Padding(
            padding: const EdgeInsets.only(left:16,top:16,bottom:16, right:8),
            child: Container(
              decoration: BoxDecoration(
                color: widget.selectedGender == true ? 
                AppColors.backgroundComponentSelected:  
                AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image.asset(widget.image,height: 100),
                    SizedBox(height: 10),
                    Text(widget.gender.toUpperCase(), 
                    style: TextStyles.bodyText)
                  ],
                ),
              ),
            ),
          //)
          )
        ),
    ); 
  }
}
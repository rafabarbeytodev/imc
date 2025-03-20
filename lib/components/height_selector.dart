import 'package:flutter/material.dart';
import 'package:imc/core/app_color.dart';
import 'package:imc/core/constants.dart';
import 'package:imc/core/text_styles.dart';

class HeightSelector extends StatefulWidget {

  final Function(int) onChange;

  const HeightSelector({super.key, required this.onChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  
  double height = Constants.heightInitial; //Altura inicial

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("ALTURA", style: TextStyles.bodyText),
            ),
            Text(
              "${height.toStringAsFixed(0)} cm",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Slider(
              value: height,
              min: Constants.heightMin,
              max: Constants.heightMax,
              divisions:
                  Constants.heightMax.toInt() - Constants.heightMin.toInt(),
              activeColor: AppColors.primary,
              //label: height.toStringAsFixed(0),
              onChanged: (double value) {
                setState(() {
                  height = value;
                });
                widget.onChange(value.toInt());
              },
            ),
          ],
        ),
      ),
    );
  }
}

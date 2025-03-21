import 'package:flutter/material.dart';
import 'package:imc/core/app_color.dart';
import 'package:imc/core/constants.dart';
import 'package:imc/core/text_styles.dart';
import 'package:imc/data/imc_result.dart';
import 'package:imc/navigation/routes.dart';

class ImcResultScreen extends StatelessWidget {
  final int height;
  final int weight;
  final int edge;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
    required this.edge,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    
    double imc = weight / ((height / 100) * (height / 100));
    ImcResult imcResult = getImcResult(imc);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your result is",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      imcResult.title,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: imcResult.color,
                     ),
                    ),
                    Text(
                      imc.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 76,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        imcResult.description,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                AppRoutes.goToImcHomeScreen(context);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("END", style: TextStyles.bodyText),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("IMC Result"),
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
    );
  }
  
  ImcResult getImcResult(double imc) {
    return switch (imc) {
      < 18.5 => Constants.imcResultLow,
      < 24.9 => Constants.imcResultNormal,
      < 29.99 => Constants.imcResultOverWeight,
      _ => Constants.imcResultObesity,
    };
  }
}

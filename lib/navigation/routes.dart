import 'package:flutter/material.dart';
import 'package:imc/screens/imc_home_screen.dart';
import 'package:imc/screens/imc_result_screen.dart';

class AppRoutes {

  //Navegacion a la pantalla de resultados
  static void goToImcResultScreen(
    BuildContext context,
    int height,
    int weight,
    int edge, 
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                ImcResultScreen(height: height, weight: weight, edge: edge),
      ),
    );
  }

  //Navegacion a la pantalla de inicio
  static void goToImcHomeScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder:
            (context) =>
                ImcHomeScreen(),
      ),
      (route) => false, // Esto elimina todas las rutas anteriores
    );
  }
}

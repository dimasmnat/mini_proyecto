import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double peso;
  final double estatura;

  ResultPage({required this.peso, required this.estatura});

  @override
  Widget build(BuildContext context) {
    double imc = peso / (estatura * estatura);
    String result = "";

   // Determinar el resultado del IMC
    if (imc < 18) {
      result = "Bajo peso";
    } else if (imc < 24.9) {
      result = "Peso normal";
    } else if (imc < 26.9) {
      result = "Sobrepeso";
    } else if (imc < 29.9) {
      result = "Obesidad tipo 1";
    } else if (imc < 39.9) {
      result = "Obesidad tipo 2";
    } else {
      result = "Obesidad tipo 3";
    }

    String message = "";

    switch (result) {
      case "Bajo peso":
        message = "Peso Bajo. Necesario valorar signos de desnutrición.";
        break;
      case "Peso normal":
        message = "Tienes un peso normal.";
        break;
      case "Sobrepeso":
        message = "Tienes sobrepeso.";
        break;
      case "Obesidad tipo 1":
        message = "Obesidad grado I. Riesgo relativo para desarrollar enfermedades cardiovasculares.";
        break;
      case "Obesidad tipo 2":
        message = "Obesidad grado II. Riesgo relativo muy alto para el desarrollo de enfermedades cardiovasculares.";
        break;
      default:
        message = "Obesidad grado III. (Extrema o mórbida). Riesgo relativo extremadamente alto para el desarrollo de enfermedades cardiovasculares.";
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado del IMC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tu IMC es",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              imc.toStringAsFixed(2),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              result,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.asset(
              getImagePath(result),
              height: 150,
            ),
          ],
        ),
      ),
    );
  }

 String getImagePath(String result) {
    if (result == "Bajo peso") {
      return "assets/bajo_peso.png";
    } else if (result == "Peso normal") {
      return "assets/peso_normal.png";
    } else if (result == "Sobrepeso") {
      return "assets/sobrepeso.png";
    } else if (result == "Obesidad tipo 1") {
      return "assets/obesidad_tipo_1.png";
    } else if (result == "Obesidad tipo 2") {
      return "assets/obesidad_tipo_2.png";
    } else {
      return "assets/obesidad_tipo_3.png";
    }
  }
}

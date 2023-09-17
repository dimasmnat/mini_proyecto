import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController estaturaController = TextEditingController();

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double estatura = double.tryParse(estaturaController.text) ?? 0.0;

    if (peso > 0 && estatura > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultPage(peso: peso, estatura: estatura),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Ingresa un peso y estatura válidos."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Peso (kg)"),
            ),
            SizedBox(height: 10), 
            TextField(
              controller: estaturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Estatura (m)"),
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: calcularIMC,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text("Calcular IMC"),
            ),
          ],
        ),
      ),
    );
  }
}


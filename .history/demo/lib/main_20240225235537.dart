import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'IMC Calculator',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<MyApp> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double imc = 0;

  void calculateIMC() {
    double height = double.parse(heightController.text) /100 ;
    double weight = double.parse(weightController.text);
    setState(() {
      imc = weight/(height*height) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: heightController,
              //keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Height (cm)'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: weightController,
              //keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateIMC();
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'IMC: ${imc.toStringAsFixed(2)}',
              style:const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              _interpretIMC(imc),
              style:const  TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            
            
          ],
        ),
      ),
    );
  }

  String _interpretIMC(double imc) {
    if (imc < 16.5) {
      return 'Famine';
    } else if (imc >= 16.5 && imc < 18.5) {
      return 'Maigreur';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Corpulence normale';
    } else if (imc >= 25 && imc < 30) {
      return 'Surpoids';
    } else if (imc >= 30 && imc < 35) {
      return 'Obesite moderee';
    } else if (imc >= 35 && imc < 40) {
      return 'Obesite severe';
    } else {
      return 'Obesite morbide';
    }
  }

  String _imageIMC (double imc){
    
  }
}

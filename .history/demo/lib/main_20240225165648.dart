import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'BMI Calculator',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<MyApp> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0;

  void calculateBMI() {
    double height = double.parse(heightController.text) /100 ;
    double weight = double.parse(weightController.text);
    setState(() {
      bmi = weight/(height*height) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        co
        title: const Text('IMC Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Height (cm)'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'IMC: ${bmi.toStringAsFixed(2)}',
              style:const  TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              _interpretBMI(bmi),
              style:const  TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  String _interpretBMI(double bmi) {
    if (bmi < 16.5) {
      return 'Famine';
    } else if (bmi >= 16.5 && bmi < 18.5) {
      return 'Maigreur';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Corpulence normale';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Surpoids';
    } else if (bmi >= 30 && bmi < 35) {
      return 'Obesite moderee';
    } else if (bmi >= 35 && bmi < 40) {
      return 'Obesite severe';
    } else {
      return 'Obesite morbide';
    }
  }
}

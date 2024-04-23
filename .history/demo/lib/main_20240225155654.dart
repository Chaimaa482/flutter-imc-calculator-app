import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'BMI Calculator',
    home: BMICalculator(),
  ));
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0.0;

  void calculateBMI() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
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
            SizedBox(const height: 16.0),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text(
              'BMI: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              _interpretBMI(bmi),
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  String _interpretBMI(double bmi) {
    if (bmi < 16) {
      return 'Morbid obesity';
    } else if (bmi >= 16 && bmi < 17) {
      return 'Severe obesity';
    } else if (bmi >= 17 && bmi < 18.5) {
      return 'Moderate obesity';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal (healthy weight)';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi < 35) {
      return 'Obesity Class 1 (Moderate)';
    } else if (bmi >= 35 && bmi < 40) {
      return 'Obesity Class 2 (Severe)';
    } else {
      return 'Obesity Class 3 (Very Severe)';
    }
  }
}

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
      body: SingleChildScrollView (
        child: Padding(
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
              child: const Text('Calculer'),
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
            imc == 0 ? const SizedBox(height: 16.0) : _buildImage(imc),
            
            
            
          ],
        ),
      ),
      ) 
      
    );
  }

  String _interpretIMC(double imc) {
    if (imc == 0) {
      return '';
    } else if (imc <16.5) {
      return 'Famine';
    }else if (imc >= 16.5 && imc < 18.5) {
      return 'Maigreur';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Corpulence normale';
    } else if (imc >= 25 && imc < 30) {
      return 'Surpoids';
    } else if (imc >= 30 && imc < 35) {
      return 'Obésité modérée';
    } else if (imc >= 35 && imc < 40) {
      return 'Obésité sevère';
    } else {
      return 'Obésité morbide';
    }
  }

   Widget _buildImage(double imc) {
    if (imc < 16.5) {
      return Image.asset('assets/img7.png');
    } else if (imc >= 16.5 && imc < 18.5) {
      return Image.asset('assets/img6.png');
    } else if (imc >= 18.5 && imc < 25) {
      return Image.asset('assets/img5.png');
    } else if (imc >= 25 && imc < 30) {
      return Image.asset('assets/img4.png');
    } else if (imc >= 30 && imc < 35) {
      return Image.asset('assets/img3.png');
    } else if (imc >= 35 && imc < 40) {
      return Image.asset('assets/img2.png');
    } else {
      return Image.asset('assets/img1.png');
    }
  }
 
}



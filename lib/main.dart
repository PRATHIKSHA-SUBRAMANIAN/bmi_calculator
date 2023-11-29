import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 106, 22, 252)),
        useMaterial3: true,
      ),
      home: const BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0.0;

  bool showBmi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigo,
                ),
          ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter height in cm',
              ),
              controller: heightController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter weight in kg',
              ),
              controller: weightController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double height = double.parse(heightController.text);
                  double weight = double.parse(weightController.text);
                  bmi = (weight / (height * height)) * 10000;
                  showBmi = true;
                });
              },
              child: const Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: prefer_interpolation_to_compose_strings
            showBmi
                ? Text(
                    "BMI: " + bmi.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

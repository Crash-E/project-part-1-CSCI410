import 'package:flutter/material.dart';

class ImperialMetricConverter extends StatefulWidget {
  const ImperialMetricConverter({super.key});

  @override
  State<ImperialMetricConverter> createState() => _ImperialMetricConverterState();
}

class _ImperialMetricConverterState extends State<ImperialMetricConverter> {
  final TextEditingController controller = TextEditingController();
  double? convertedValue;
  String selectedConversion = 'Inches to Centimeters';

  final Map<String, double> conversionRates = {
    'Inches to Centimeters': 2.54,
    'Centimeters to Inches': 0.393701,
    'Pounds to Kilograms': 0.453592,
    'Kilograms to Pounds': 2.20462,
    'Feet to meters': 0.3048,
    'meter to feet': 3.28084,
  };

  void convert() {
    final value = double.tryParse(controller.text);
    if (value != null) {
      setState(() {
        convertedValue = value * (conversionRates[selectedConversion] ?? 1.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<String>(
            value: selectedConversion,
            items: conversionRates.keys.map((conversion) {
              return DropdownMenuItem(
                value: conversion,
                child: Text(conversion),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedConversion = value;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter Value",
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: convert,
            child: const Text("Convert"),
          ),
          const SizedBox(height: 20),
          if (convertedValue != null)
            Text(
              'Converted Value: ${convertedValue!.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}

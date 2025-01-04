import 'package:flutter/material.dart';

TextEditingController amountController = TextEditingController();

String fromCurrency = 'USD';
String toCurrency = 'EUR';

Map<String, Map<String, double>> exchangeRates = {
  'USD': {
    'USD': 1.0, 
    'EUR': 0.92, 
    'LBP': 89000.0, 
    'WON': 1280.0, 
    'YEN': 147.0
    },
  'EUR': {
    'USD': 1.09,
    'EUR': 1.0,
    'LBP': 89000.0 * 1.09,
    'WON': 1280.0 * 1.09 / 0.92, 
    'YEN': 147.0 * 1.09 / 0.92 
  },
  'LBP': {
    'USD': 1.0 / 89000.0, 
    'EUR': 0.92 / 89000.0, 
    'LBP': 1.0,
    'WON': 1280.0 / 89000.0, 
    'YEN': 147.0 / 89000.0 
  },
  'WON': {
    'USD': 1.0 / 1280.0, 
    'EUR': 0.92 / 1280.0, 
    'LBP': 89000.0 / 1280.0, 
    'WON': 1.0,
    'YEN': 147.0 / 1280.0 
  },
  'YEN': {
    'USD': 1.0 / 147.0, 
    'EUR': 0.92 / 147.0, 
    'LBP': 89000.0 / 147.0,
    'WON': 1280.0 / 147.0, 
    'YEN': 1.0
  }
};

Future<double> convertCurrency() async {
  final double? amount = double.tryParse(amountController.text);
  if (amount != null) {
    return amount * (exchangeRates[fromCurrency]?[toCurrency] ?? 1.0);
  }
  return 0.0;
}

class CurrencyDropDown extends StatelessWidget {
  final String label;
  final Function(String) onCurrencySelected;

  const CurrencyDropDown(
      {required this.label, required this.onCurrencySelected, super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      value: label == "From" ? fromCurrency : toCurrency,
      items: exchangeRates.keys.map((currency) {
        return DropdownMenuItem(
          value: currency,
          child: Text(currency),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          onCurrencySelected(value);
        }
      },
    );
  }
}

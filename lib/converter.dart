import 'package:flutter/material.dart';


TextEditingController amountController = TextEditingController();


String fromCurrency = 'USD';
String toCurrency = 'EUR';


Map<String, Map<String, double>> exchangeRates = {
  'USD': {'USD': 1.0, 'EUR': 0.92, 'LBP': 15000.0, 'WON': 1280.0, 'YEN': 147.0},
  'EUR': {'USD': 1.09, 'EUR': 1.0, 'LBP': 16250.0, 'WON': 1390.0, 'YEN': 160.0},
  'LBP': {'USD': 0.000067, 'EUR': 0.000061, 'LBP': 1.0, 'WON': 0.085, 'YEN': 0.0098},
  'WON': {'USD': 0.00078, 'EUR': 0.00072, 'LBP': 11.76, 'WON': 1.0, 'YEN': 0.11},
  'YEN': {'USD': 0.0068, 'EUR': 0.0063, 'LBP': 102.0, 'WON': 9.3, 'YEN': 1.0},
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

  const CurrencyDropDown({required this.label, required this.onCurrencySelected, super.key});

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

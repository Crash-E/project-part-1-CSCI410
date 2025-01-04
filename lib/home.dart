import 'package:flutter/material.dart';
import 'converter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? convertedAmount = 0.0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 234, 65),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Select Currency',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CurrencyDropDown(
                      label: "From",
                      onCurrencySelected: (currency) {
                        setState(() {
                          fromCurrency = currency;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CurrencyDropDown(
                      label: "To",
                      onCurrencySelected: (currency) {
                        setState(() {
                          toCurrency = currency;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Amount",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final result = await convertCurrency();
                  setState(() {
                    convertedAmount = result;
                  });
                },
                child: const Text("Convert"),
              ),
              const SizedBox(height: 20),
              if (convertedAmount != null)
                Text(
                  'Converted Amount: ${convertedAmount!.toStringAsFixed(2)} $toCurrency',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

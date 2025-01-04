import 'package:flutter/material.dart';
import 'converter.dart';
import 'imperial_metric.dart';
import 'lbp_price.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Multi Converter'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 23, 234, 65),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Currency"),
              Tab(text: "Imperial-Metric"),
              Tab(text: "LBP to USD"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CurrencyConverter(),
            ImperialMetricConverter(),
            LBPPriceInDollars(),
          ],
        ),
      ),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double? convertedAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

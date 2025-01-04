import 'package:flutter/material.dart';

class LBPPriceInDollars extends StatelessWidget {
  const LBPPriceInDollars({super.key});

  @override
  Widget build(BuildContext context) {
    const double exchangeRate = 89000.0; // 1 USD = 89,000 LBP

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current Exchange Rate',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '1 USD = ${exchangeRate.toStringAsFixed(0)} LBP',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

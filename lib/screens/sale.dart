import 'package:flutter/material.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
             Icons.local_offer,
              size: 60,
              color: Colors.grey,

            ),
            Text('Sale', style: TextStyle(fontSize: 24, color:  Colors.grey),)
          ],
        ),
      ),
    );
  }
}

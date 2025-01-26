import 'package:flutter/material.dart';

class CurateScreen extends StatelessWidget {
  const CurateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.brush,
              size: 60,
              color: Colors.grey,

            ),
            Text('Curate', style: TextStyle(fontSize: 24, color:  Colors.grey),)
          ],
        ),
      ),
    );
  }
}

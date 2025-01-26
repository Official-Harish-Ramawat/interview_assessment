import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.more_horiz,
              size: 60,
              color: Colors.grey,

            ),
            Text('More', style: TextStyle(fontSize: 24, color:  Colors.grey),)
          ],
        ),
      ),
    );
  }
}

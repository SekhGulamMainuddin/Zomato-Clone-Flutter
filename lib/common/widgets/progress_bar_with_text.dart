import 'package:flutter/material.dart';

class ProgressBarWithText extends StatelessWidget {
  final String text;
  const ProgressBarWithText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

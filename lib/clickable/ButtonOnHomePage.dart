import 'package:flutter/material.dart';

class ButtonOnHomePage extends StatelessWidget {
  ButtonOnHomePage(
      {super.key, required displayedText, required backgroundColor}) {
    _displayedText = displayedText;
    _backgroundColor = backgroundColor;
  }

  late final Color _backgroundColor;
  late final String _displayedText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          //To implement: different behavior depending on the button type
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: _backgroundColor,
          textStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          disabledForegroundColor: Colors.blue.withOpacity(0.30),
          disabledBackgroundColor: Colors.blue.withOpacity(0.10),
          minimumSize: const Size(190, 90),
          shadowColor: Colors.grey,
          elevation: 10,
          side: BorderSide(
              color: Colors.redAccent.shade700,
              width: 4,
              style: BorderStyle.solid),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
        child: Text(_displayedText));
  }
}

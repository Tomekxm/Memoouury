import 'package:flutter/material.dart';

class ChooseBoardSizeWidget extends StatelessWidget {
  const ChooseBoardSizeWidget({super.key});

  static int boardSize = 6;
  static const double _fontSize = 23;
  static const double _padding = 10;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Center(
          child: Text(
        'Wybierz rozmiar planszy!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.normal,
          fontFamily: 'BungeeSpice',
          fontSize: 33,
        ),
      )),
      children: <Widget>[
        SimpleDialogOption(
            onPressed: () {
              boardSize = 4;
              Navigator.pop(context);
            },
            padding: const EdgeInsets.only(bottom: _padding, top: _padding),
            child: const Center(
              child: Text(
                '4x4',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: _fontSize,
                ),
              ),
            )),
        SimpleDialogOption(
            onPressed: () {
              boardSize = 6;
              Navigator.pop(context);
            },
            padding: const EdgeInsets.only(bottom: _padding),
            child: const Center(
              child: Text(
                '6x6',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: _fontSize,
                ),
              ),
            )),
        SimpleDialogOption(
            onPressed: () {
              boardSize = 8;
              Navigator.pop(context);
            },
            child: const Center(
              child: Text(
                '8x8',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: _fontSize,
                ),
              ),
            ))
      ],
    );
  }
}

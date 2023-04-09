import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ChooseCardSetWidget extends StatelessWidget {
  const ChooseCardSetWidget({super.key});

  static String cardSetDirectory = "assets/cardSets/monsters";
  static String? _directory = "";
  static const double _fontSize = 23;
  static const double _padding = 15;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Center(
          child: Text(
        'Wybierz zestaw kart!',
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
              cardSetDirectory = "assets/cardSets/monsters";
              Navigator.pop(context);
            },
            padding: const EdgeInsets.only(bottom: _padding,top: _padding),
            child: const Center(
              child: Text(
                'Potwory',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: _fontSize,
                ),
              ),
            )),
        SimpleDialogOption(
            onPressed: () {
              cardSetDirectory = "assets/cardSets/footballers";
              Navigator.pop(context);
            },
            padding: const EdgeInsets.only(bottom: _padding),
            child: const Center(
              child: Text(
                'Piłkarze',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: _fontSize,
                ),
              ),
            )),
        SimpleDialogOption(
            onPressed: () async {
              _directory = await FilePicker.platform.getDirectoryPath();
              if (_directory != null) {
                cardSetDirectory = _directory!;
              }
              Navigator.pop(context);
            },
            child: const Center(
              child: Text(
                'Zaimportuj swój własny zestaw!',
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

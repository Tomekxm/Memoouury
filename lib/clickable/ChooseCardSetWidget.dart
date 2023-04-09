import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ChooseCardSetWidget extends StatelessWidget {
  const ChooseCardSetWidget({super.key});

  static String cardSetDirectory = "assets/cardSets/monsters";
  static String? _directory = "";

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Wybierz zestaw kart!'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            cardSetDirectory = "assets/cardSets/monsters";
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text('Potwory'),
        ),
        SimpleDialogOption(
          onPressed: () {
            cardSetDirectory = "assets/cardSets/footballers";
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text('Piłkarze'),
        ),
        SimpleDialogOption(
          onPressed: () async {
            _directory = await FilePicker.platform.getDirectoryPath();
            if (_directory != null){
              cardSetDirectory = _directory!;
            }
            Navigator.pop(context);
          },
          child: const Text('Zaimportuj swój własny zestaw!'),
        )
      ],
    );
  }
}

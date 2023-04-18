import 'package:flutter/material.dart';
import 'package:memoouury/clickable/ChooseBoardSizeWidget.dart';
import 'package:memoouury/pages/GamePage.dart';
import 'ChooseCardSetWidget.dart';

enum ButtonType { startButton, boardSizeButton, cardSetButton }

class ButtonOnHomePage extends StatelessWidget {
  ButtonOnHomePage(
      {super.key,
      required String displayedText,
      required Color backgroundColor,
      required ButtonType buttonType}) {
    _displayedText = displayedText;
    _backgroundColor = backgroundColor;
    _buttonType = buttonType;
  }

  late final ButtonType _buttonType;
  late final Color _backgroundColor;
  late final String _displayedText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          switch (_buttonType) {
            case ButtonType.startButton:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GamePage(
                          boardSize: ChooseBoardSizeWidget.boardSize,
                          cardSetDirectory:
                              ChooseCardSetWidget.cardSetDirectory)),
                );
              }
              break;
            case ButtonType.boardSizeButton:
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChooseBoardSizeWidget().build(context);
                    });
              }
              break;
            case ButtonType.cardSetButton:
              {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChooseCardSetWidget().build(context);
                    });
              }
              break;
            default:
              break;
          }
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

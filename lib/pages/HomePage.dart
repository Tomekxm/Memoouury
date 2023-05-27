import 'package:flutter/material.dart';
import 'package:memoouury/pages/ButtonOnHomePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final double _bottomPadding = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  height: 100,
                  width: 350,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      'Memoouury',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'BungeeSpice',
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(bottom: _bottomPadding),
                child: ButtonOnHomePage(
                    buttonType: ButtonType.startButton,
                    backgroundColor: Colors.redAccent.shade400,
                    displayedText: "Rozpocznij rozgrywkę!")),
            Padding(
                padding: EdgeInsets.only(bottom: _bottomPadding),
                child: ButtonOnHomePage(
                    buttonType: ButtonType.boardSizeButton,
                    backgroundColor: Colors.redAccent.shade200,
                    displayedText: "Wybierz rozmiar planszy!")),
            Padding(
                padding: EdgeInsets.only(bottom: _bottomPadding),
                child: ButtonOnHomePage(
                    buttonType: ButtonType.cardSetButton,
                    backgroundColor: Colors.redAccent.shade200,
                    displayedText: "Wybierz zestaw kart!"))
          ],
        ),
      ),
    );
  }
}

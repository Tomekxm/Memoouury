import 'package:flutter/material.dart';
import 'package:memoouury/Pages/HomePage.dart';

import '../clickable/GameCard.dart';

class GamePage extends StatelessWidget {
  GamePage(
      {super.key, required int boardSize, required String cardSetDirectory}) {
    _boardSize = boardSize;
    _cardSetDirectory = cardSetDirectory;
  }

  static const double _fontSize = 20;
  late final int _boardSize;
  late final String _cardSetDirectory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: IntrinsicHeight(
                child: Column(children: _buildGameBoard(context))),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton.extended(
                heroTag: "return",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                label:
                    const Text('Powrót', style: TextStyle(fontSize: _fontSize)),
                icon: const Icon(Icons.keyboard_return),
              ),
              const Text("    "),
              FloatingActionButton.extended(
                heroTag: "restart",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GamePage(
                                boardSize: _boardSize,
                                cardSetDirectory: _cardSetDirectory,
                              )));
                },
                label: const Text('Restart gry',
                    style: TextStyle(fontSize: _fontSize)),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ));
  }

  List<Widget> _buildGameBoard(BuildContext context) {
    List<Widget> rowsToReturn = <Widget>[];
    List<Widget> cardsToReturn = <Widget>[];

    for (int i = 0; i < _boardSize; i++) {
      cardsToReturn.clear();
      for (int k = 0; k < _boardSize; k++) {
        cardsToReturn.add(_buildGameCard(context));
      }
      rowsToReturn.add(Row(children: cardsToReturn));
    }
    return rowsToReturn;
  }

  Widget _buildGameCard(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xffffffff), // Red
        height: MediaQuery.of(context).size.height / (_boardSize + 1),
        alignment: Alignment.center,
        child: const GameCard().build(context),
      ),
    );
  }
}

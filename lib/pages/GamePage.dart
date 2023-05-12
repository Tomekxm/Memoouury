import 'package:flutter/material.dart';
import 'package:memoouury/Pages/HomePage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../clickable/GameCard.dart';
import '../helpers/SimpleAssetPathProvider.dart';

class GamePage extends StatelessWidget {
  GamePage(
      {super.key, required int boardSize, required String cardSetDirectory}) {
    _boardSize = boardSize;
    _cardSetDirectory = cardSetDirectory;
    _assetPathProvider = SimpleAssetPathProvider(_cardSetDirectory, _boardSize);
  }

  late SimpleAssetPathProvider _assetPathProvider;
  int _clicks = 0;
  bool _absorbing = false;
  static const double _fontSize = 20;
  late final int _boardSize;
  late final String _cardSetDirectory;
  late List<GameCard> _gameCards = [];

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: _absorbing,
        child: Scaffold(
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
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    label: const Text('Powrót',
                        style: TextStyle(fontSize: _fontSize)),
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
            )));
  }

  List<Widget> _buildGameBoard(BuildContext context) {
    List<Widget> rowsToReturn = <Widget>[];

    for (int i = 0; i < _boardSize; i++) {
      List<Widget> cardsToReturn = <Widget>[];
      for (int k = 0; k < _boardSize; k++) {
        cardsToReturn.add(_buildGameCard(context));
      }
      rowsToReturn.add(Row(children: cardsToReturn));
    }

    return rowsToReturn;
  }

  Widget _buildGameCard(BuildContext context) {
    GameCard card = GameCard(
        assetPath: _assetPathProvider.provideAssetPath(),
        onFrontCardFlipDone: _onFrontCardFlipDone);
    _gameCards.add(card);
    return Expanded(
      child: Container(
        color: const Color(0xffffffff),
        height: MediaQuery.of(context).size.height / (_boardSize + 1),
        alignment: Alignment.center,
        child: card,
      ),
    );
  }

  Future<void> _onFrontCardFlipDone(BuildContext context) async {
    _clicks++;
    if (_clicks % 2 == 0) {
      List<GameCard> flippedCards = _gameCards
          .where(
              (element) => element.flipCardController.controller!.isCompleted)
          .toList();
      if (flippedCards.first.assetPath == flippedCards.last.assetPath) {
        _gameCards.remove(flippedCards.first);
        _gameCards.remove(flippedCards.last);
        if (_gameCards.isNotEmpty) {
          showInfoDialog(context, _gameCards.length ~/ 2);
        }
      } else {
        _absorbing = true;
        Future.delayed(const Duration(milliseconds: 150), () {
          flippedCards.first.flipCardController.toggleCard();
          flippedCards.last.flipCardController.toggleCard();
        });
      }
    }
    if (_gameCards.isEmpty) {
      showWinningDialog(context, _clicks);
    }
  }
}

showWinningDialog(BuildContext context, int totalClicks) {
  QuickAlert.show(
    title: "Gratulacje!",
    confirmBtnText: 'Powrót do menu',
    onConfirmBtnTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    },
    context: context,
    type: QuickAlertType.success,
    text: 'Ukończyłeś grę Memoouury w $totalClicks kliknęciach!',
  );
}

showInfoDialog(BuildContext context, int remainingPairs) {
  QuickAlert.show(
    title: "Poprawne dopasowanie!",
    confirmBtnText: 'OK',
    onConfirmBtnTap: () {
      Navigator.of(context).pop();
    },
    context: context,
    type: QuickAlertType.info,
    text: 'Zostało Ci $remainingPairs par kart.',
  );
}

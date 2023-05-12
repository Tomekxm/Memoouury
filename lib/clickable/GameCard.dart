import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class GameCard extends StatefulWidget {
  GameCard(
      {super.key, required this.assetPath, required this.onFrontCardFlipDone});

  String assetPath = "";
  void Function(BuildContext context) onFrontCardFlipDone =
      (BuildContext context) {};
  FlipCardController flipCardController = FlipCardController();

  @override
  GameCardState createState() => GameCardState();
}

class GameCardState extends State<GameCard> {
  String _assetPath = "";
  bool _flipOnTouch = true;
  FlipCardController _flipCardController = FlipCardController();
  late void Function(BuildContext context) _onFrontCardFlipDone;

  @override
  void initState() {
    super.initState();
    _assetPath = widget.assetPath;
    _onFrontCardFlipDone = widget.onFrontCardFlipDone;
    _flipCardController = widget.flipCardController;
  }

  void changeFlipping() {
    setState(() {
      _flipOnTouch = !_flipOnTouch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin:
          const EdgeInsets.only(left: 1.0, right: 1.0, top: 1.0, bottom: 0.0),
      color: const Color(0x00000000),
      child: FlipCard(
        flipOnTouch: _flipOnTouch,
        fill: Fill.fillFront,
        controller: _flipCardController,
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          changeFlipping();
          if (status == true) {
            _onFrontCardFlipDone(context);
          }
        },
        front: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/cardSets/cardReverse.jpg', fit: BoxFit.cover)
            ],
          ),
        ),
        back: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Image.asset(_assetPath, fit: BoxFit.cover)],
          ),
        ),
      ),
    );
  }
}

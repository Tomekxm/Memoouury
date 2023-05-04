import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  GameCard({super.key, required this.assetPath});

  String assetPath;
  final FlipCardController flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin:
          const EdgeInsets.only(left: 1.0, right: 1.0, top: 1.0, bottom: 0.0),
      color: const Color(0x00000000),
      child: FlipCard(
        fill: Fill.fillFront,
        controller: flipCardController,
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {},
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
            children: <Widget>[
              Image.asset(assetPath, fit: BoxFit.cover)
            ],
          ),
        ),
      ),
    );
  }
}

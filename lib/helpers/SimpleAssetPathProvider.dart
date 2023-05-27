class SimpleAssetPathProvider {
  late final String _assetsDirectory;
  late final int _boardSize;
  late List<String> _cardsPaths;

  SimpleAssetPathProvider(this._assetsDirectory, this._boardSize) {
    if (_assetsDirectory == "assets/cardSets/monsters") {
      _monsters.shuffle();
      _cardsPaths = _monsters.take(_boardSize*_boardSize~/2).toList();
    } else if (_assetsDirectory == "assets/cardSets/footballers") {
      _footballers.shuffle();
      _cardsPaths = _footballers.take(_boardSize*_boardSize~/2).toList();
    } else if (_assetsDirectory == "assets/cardSets/cartoonsCharacters") {
      _cartoonsCharacters.shuffle();
      _cardsPaths = _cartoonsCharacters.take(_boardSize*_boardSize~/2).toList();
    } else {
      throw "Unexpected problem with cards has occurred!";
    }
    _cardsPaths = _cardsPaths + _cardsPaths;
    _cardsPaths.shuffle();
  }

  String provideAssetPath() {
    String toReturnPath;
    if (_cardsPaths.isNotEmpty) {
      toReturnPath = _cardsPaths.removeLast();
    } else {
      throw "Unexpected problem with cards has occurred!";
    }
    return toReturnPath;
  }

  final List<String> _monsters = [
    'assets/cardSets/monsters/demon.jpg',
    'assets/cardSets/monsters/goblin.jpg',
    'assets/cardSets/monsters/monster.jpg',
    'assets/cardSets/monsters/ogre.jpg',
    'assets/cardSets/monsters/org.jpg',
    'assets/cardSets/monsters/skull.jpg',
    'assets/cardSets/monsters/vampire.jpg',
    'assets/cardSets/monsters/werewolf.jpg',
    'assets/cardSets/monsters/zjawa.jpg',
    'assets/cardSets/monsters/czort.jpg',
    'assets/cardSets/monsters/czort2.jpg',
    'assets/cardSets/monsters/dimon.jpg',
    'assets/cardSets/monsters/diobel.jpg',
    'assets/cardSets/monsters/eater.jpg',
    'assets/cardSets/monsters/nunu.jpg',
    'assets/cardSets/monsters/slender.jpg',
    'assets/cardSets/monsters/trap.jpg',
    'assets/cardSets/monsters/badangel.jpg',
  ];

  final List<String> _footballers = [
    'assets/cardSets/footballers/p1.jpg',
    'assets/cardSets/footballers/p2.jpg',
    'assets/cardSets/footballers/p3.jpg',
    'assets/cardSets/footballers/p4.jpg',
    'assets/cardSets/footballers/p5.jpg',
    'assets/cardSets/footballers/p6.jpg',
    'assets/cardSets/footballers/p7.jpg',
    'assets/cardSets/footballers/p8.jpg',
    'assets/cardSets/footballers/p9.jpg',
    'assets/cardSets/footballers/p10.jpg',
    'assets/cardSets/footballers/p11.jpg',
    'assets/cardSets/footballers/p12.jpg',
    'assets/cardSets/footballers/p13.jpg',
    'assets/cardSets/footballers/p14.jpg',
    'assets/cardSets/footballers/p15.jpg',
    'assets/cardSets/footballers/p16.jpg',
    'assets/cardSets/footballers/p17.jpg',
    'assets/cardSets/footballers/p18.jpg',
  ];

  final List<String> _cartoonsCharacters = [
    'assets/cardSets/cartoonsCharacters/c1.jpg',
    'assets/cardSets/cartoonsCharacters/c2.jpg',
    'assets/cardSets/cartoonsCharacters/c3.jpg',
    'assets/cardSets/cartoonsCharacters/c4.jpg',
    'assets/cardSets/cartoonsCharacters/c5.jpg',
    'assets/cardSets/cartoonsCharacters/c6.jpg',
    'assets/cardSets/cartoonsCharacters/c7.jpg',
    'assets/cardSets/cartoonsCharacters/c8.jpg',
    'assets/cardSets/cartoonsCharacters/c9.jpg',
    'assets/cardSets/cartoonsCharacters/c10.jpg',
    'assets/cardSets/cartoonsCharacters/c11.jpg',
    'assets/cardSets/cartoonsCharacters/c12.jpg',
    'assets/cardSets/cartoonsCharacters/c13.jpg',
    'assets/cardSets/cartoonsCharacters/c14.jpg',
    'assets/cardSets/cartoonsCharacters/c15.jpg',
    'assets/cardSets/cartoonsCharacters/c16.jpg',
    'assets/cardSets/cartoonsCharacters/c17.jpg',
    'assets/cardSets/cartoonsCharacters/c18.jpg',
  ];
}

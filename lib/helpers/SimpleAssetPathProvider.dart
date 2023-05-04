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
    'assets/cardSets/monsters/werewolf.jpg'
  ];

  final List<String> _footballers = [];

  final List<String> _cartoonsCharacters = [];
}

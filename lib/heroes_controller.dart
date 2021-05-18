import 'package:flutter/cupertino.dart';
import 'package:hero_app/hero_model.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: "Spider-Man"),
    HeroModel(name: "Iro Man"),
    HeroModel(name: "Captain America"),
    HeroModel(name: "Thor"),
    HeroModel(name: "Hulk"),
  ];

  checkFavorite(HeroModel heroModel) {
    heroModel.isFavorite = !heroModel.isFavorite;
    notifyListeners();
  }
}

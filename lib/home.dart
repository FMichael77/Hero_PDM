import 'package:flutter/material.dart';
import 'package:hero_app/hero_model.dart';
import 'package:hero_app/heroes_controller.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItens(heroesController.heroes[index]);
      },
    );
  }

  _buildItens(HeroModel heroModel) {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListTile(
      onTap: () {
        heroesController.checkFavorite(heroModel);
      },
      title: Text(heroModel.name),
      trailing: heroModel.isFavorite
          ? Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heroes"),
        centerTitle: true,
        leading: Consumer<HeroesController>(
            builder: (context, heroesController, widget) {
          return Center(
              child: Text(
            "${heroesController.heroes.where((i) => i.isFavorite).length}",
            style: TextStyle(fontSize: 20),
          ));
        }),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList();
        },
      ),
    );
  }
}

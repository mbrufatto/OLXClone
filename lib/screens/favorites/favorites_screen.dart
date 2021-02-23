import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_clone/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_clone/components/empty_card.dart';
import 'package:xlo_clone/stores/favorite_store.dart';

import 'components/favorite_tile.dart';

class FavoritesScreen extends StatelessWidget {
  final bool hideDrawer;
  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  FavoritesScreen({this.hideDrawer = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        centerTitle: true,
      ),
      drawer: hideDrawer ? null : CustomDrawer(),
      body: Observer(
        builder: (_) {
          if (favoriteStore.favoriteList.isEmpty) {
            return EmptyCard('Nenhum anúncio favoritado.');
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(2),
              itemCount: favoriteStore.favoriteList.length,
              itemBuilder: (_, index) => FavoriteTile(
                favoriteStore.favoriteList[index],
              ),
            );
          }
        },
      ),
    );
  }
}

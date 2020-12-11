import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_clone/components/custom_drawer/page_tile.dart';
import 'package:xlo_clone/stores/page_store.dart';

class PageSection extends StatelessWidget {

  final PageStore pageStorage = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            pageStorage.setPage(0);
          },
          highlighted: pageStorage.page == 0,
        ),

        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {
            pageStorage.setPage(1);
          },
          highlighted: pageStorage.page == 1,
        ),

        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            pageStorage.setPage(2);
          },
          highlighted: pageStorage.page == 2,
        ),

        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            pageStorage.setPage(3);
          },
          highlighted: pageStorage.page == 3,
        ),

        PageTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {
            pageStorage.setPage(4);
          },
          highlighted: pageStorage.page == 4,
        ),
      ],
    );
  }
}

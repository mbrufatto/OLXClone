import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xlo_clone/helpers/extensions.dart';
import 'package:xlo_clone/models/ad.dart';
import 'package:xlo_clone/screens/ad/ad_screen.dart';

class ActiveTile extends StatelessWidget {
  final Ad ad;

  ActiveTile(this.ad);

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Já Vendi', iconData: Icons.thumb_up),
    MenuChoice(index: 2, title: 'Excluir', iconData: Icons.delete),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AdScreen(ad)),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Container(
          height: 80,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: ad.images.isEmpty
                      ? 'https://static.thenounproject.com/png/194055-200.png'
                      : ad.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ad.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ad.price.formattedMoney(),
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '${ad.views} visitas',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  PopupMenuButton<MenuChoice>(
                      onSelected: (choice) {
                        switch (choice.index) {
                          case 0:
                            break;
                          case 1:
                            break;
                          case 2:
                            break;
                        }
                      },
                      icon: Icon(
                        Icons.more_vert,
                        size: 20,
                        color: Colors.purple,
                      ),
                      itemBuilder: (_) {
                        return choices
                            .map((choice) => PopupMenuItem<MenuChoice>(
                                  value: choice,
                                  child: Row(
                                    children: [
                                      Icon(
                                        choice.iconData,
                                        size: 20,
                                        color: Colors.purple,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        choice.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuChoice {
  final int index;
  final String title;
  final IconData iconData;

  MenuChoice({this.index, this.title, this.iconData});
}
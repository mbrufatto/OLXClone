import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_clone/models/ad.dart';
import 'package:xlo_clone/screens/ad/components/bottom_bar.dart';
import 'package:xlo_clone/screens/ad/components/description_panel.dart';
import 'package:xlo_clone/screens/ad/components/location_panel.dart';
import 'package:xlo_clone/screens/ad/components/main_panel.dart';
import 'package:xlo_clone/screens/ad/components/user_panel.dart';
import 'package:xlo_clone/stores/favorite_store.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';

class AdScreen extends StatelessWidget {
  final Ad ad;
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  AdScreen(this.ad);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Anúncio'),
        centerTitle: true,
        actions: [
          if (ad.status == AdStatus.ACTIVE && userManagerStore.isLoggedIn)
            Observer(builder: (_) {
              return IconButton(
                icon: Icon(
                  favoriteStore.favoriteList.any((a) => a.id == ad.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                onPressed: () => favoriteStore.toggleFavorite(ad),
              );
            })
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 280,
                child: Carousel(
                  images: ad.images
                      .map(
                        (url) => CachedNetworkImageProvider(url),
                      )
                      .toList(),
                  dotSize: 4,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.orange,
                  autoplay: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainPanel(ad),
                    Divider(color: Colors.grey[500]),
                    DescriptionPanel(ad),
                    Divider(color: Colors.grey[500]),
                    LocationPanel(ad),
                    Divider(color: Colors.grey[500]),
                    UserPanel(ad),
                    SizedBox(height: ad.status == AdStatus.PENDING ? 16 : 120),
                  ],
                ),
              )
            ],
          ),
          BottomBar(ad),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/screens/account/account_screen.dart';
import 'package:xlo_clone/screens/create/create_screen.dart';
import 'package:xlo_clone/screens/favorites/favorites_screen.dart';
import 'package:xlo_clone/screens/home/home_screen.dart';
import 'package:xlo_clone/screens/offline/offline_screen.dart';
import 'package:xlo_clone/stores/connectivity_store.dart';
import 'package:xlo_clone/stores/page_store.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final PageStore pageStorage = GetIt.I<PageStore>();
  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  @override
  void initState() {
    super.initState();

    reaction(
        (_) => pageStorage.page, (page) => pageController.jumpToPage(page));

    autorun((_) {
      if (!connectivityStore.connected) {
        Future.delayed(Duration(milliseconds: 50)).then((value) {
          showDialog(
            context: context,
            builder: (_) => OfflineScreen(),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          CreateScreen(),
          Container(
            color: Colors.yellow,
          ),
          FavoritesScreen(),
          AccountScreen(),
        ],
      ),
    );
  }
}

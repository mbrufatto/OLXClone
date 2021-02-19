import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/screens/myads/components/active_tile.dart';
import 'package:xlo_clone/screens/myads/components/pending_tile.dart';
import 'package:xlo_clone/screens/myads/components/sold_tile.dart';
import 'package:xlo_clone/stores/myads_store.dart';

class MyAdsScreen extends StatefulWidget {
  final int initialPage;

  MyAdsScreen({this.initialPage = 0});

  @override
  _MyAdsScreenState createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  final MyAdsStore myAdsStore = MyAdsStore();

  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Anúncios'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: [
            Tab(
              child: Text('ATIVOS'),
            ),
            Tab(
              child: Text('PENDENTES'),
            ),
            Tab(
              child: Text('VENDIDOS'),
            ),
          ],
        ),
      ),
      body: Observer(builder: (_) {
        if (myAdsStore.loading)
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          );

        return TabBarView(
          controller: tabController,
          children: [
            Observer(builder: (_) {
              if (myAdsStore.activeAds.isEmpty) {
                return Container();
              }
              return ListView.builder(
                  itemCount: myAdsStore.activeAds.length,
                  itemBuilder: (_, index) {
                    return ActiveTile(myAdsStore.activeAds[index], myAdsStore);
                  });
            }),
            Observer(builder: (_) {
              if (myAdsStore.pendingAds.isEmpty) {
                return Container();
              }
              return ListView.builder(
                  itemCount: myAdsStore.pendingAds.length,
                  itemBuilder: (_, index) {
                    return PendingTile(myAdsStore.pendingAds[index]);
                  });
            }),
            Observer(builder: (_) {
              if (myAdsStore.soldAds.isEmpty) {
                return Container();
              }
              return ListView.builder(
                  itemCount: myAdsStore.soldAds.length,
                  itemBuilder: (_, index) {
                    return SoldTile(myAdsStore.soldAds[index], myAdsStore);
                  });
            }),
          ],
        );
      }),
    );
  }
}

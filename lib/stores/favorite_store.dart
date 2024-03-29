import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/models/ad.dart';
import 'package:xlo_clone/repositories/favorite_repository.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  ObservableList favoriteList = ObservableList<Ad>();

  _FavoriteStore() {
    reaction((_) => userManagerStore.isLoggedIn, (_) {
      _getFavoriteList();
    });
  }

  @action
  Future<void> _getFavoriteList() async {
    try {
      favoriteList.clear();
      final favorites =
          await FavoriteRepository().getFavorites(userManagerStore.user);
      favoriteList.addAll(favorites);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> toggleFavorite(Ad ad) async {
    try {
      if (favoriteList.any((a) => a.id == ad.id)) {
        favoriteList.removeWhere((a) => a.id == ad.id);
        await FavoriteRepository().delete(ad: ad, user: userManagerStore.user);
      } else {
        favoriteList.add(ad);
        await FavoriteRepository().save(ad: ad, user: userManagerStore.user);
      }
    } catch (e) {
      print(e);
    }
  }
}

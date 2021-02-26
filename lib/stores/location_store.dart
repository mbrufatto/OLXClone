import 'package:mobx/mobx.dart';
import 'package:xlo_clone/repositories/location_repository.dart';

part 'location_store.g.dart';

class LocationStore = _LocationStore with _$LocationStore;

abstract class _LocationStore with Store {
  _LocationStore() {
    _currentLocation();
  }

  @action
  Future<void> _currentLocation() async {
    try {
      currentCity = await LoacationRepository().determinePosition();
      error = null;
    } catch (e) {
      error = e;
      currentCity = null;
    }
  }

  @observable
  String currentCity;

  @observable
  String error;
}

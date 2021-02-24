import 'package:geocoding/geocoding.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/repositories/location_repository.dart';

part 'location_store.g.dart';

class LocationStore = _LocationStore with _$LocationStore;

abstract class _LocationStore with Store {
  _LocationStore() {
    _currentLocation();
  }

  @observable
  String currentCity = '';

  @observable
  String error;

  @action
  Future<void> _currentLocation() async {
    try {
      final position = await LoacationRepository().determinePosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      currentCity = placemarks.first.subAdministrativeArea;
      error = null;
    } catch (e) {
      error = e;
      currentCity = null;
    }
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationStore on _LocationStore, Store {
  final _$currentCityAtom = Atom(name: '_LocationStore.currentCity');

  @override
  String get currentCity {
    _$currentCityAtom.reportRead();
    return super.currentCity;
  }

  @override
  set currentCity(String value) {
    _$currentCityAtom.reportWrite(value, super.currentCity, () {
      super.currentCity = value;
    });
  }

  final _$errorAtom = Atom(name: '_LocationStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_currentLocationAsyncAction =
      AsyncAction('_LocationStore._currentLocation');

  @override
  Future<void> _currentLocation() {
    return _$_currentLocationAsyncAction.run(() => super._currentLocation());
  }

  @override
  String toString() {
    return '''
currentCity: ${currentCity},
error: ${error}
    ''';
  }
}

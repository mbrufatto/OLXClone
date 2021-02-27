// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStore on _FilterStore, Store {
  Computed<String> _$priceErrorComputed;

  @override
  String get priceError =>
      (_$priceErrorComputed ??= Computed<String>(() => super.priceError,
              name: '_FilterStore.priceError'))
          .value;
  Computed<bool> _$isTypeParticularComputed;

  @override
  bool get isTypeParticular => (_$isTypeParticularComputed ??= Computed<bool>(
          () => super.isTypeParticular,
          name: '_FilterStore.isTypeParticular'))
      .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_FilterStore.isFormValid'))
          .value;
  Computed<List<UF>> _$allStateListComputed;

  @override
  List<UF> get allStateList =>
      (_$allStateListComputed ??= Computed<List<UF>>(() => super.allStateList,
              name: '_FilterStore.allStateList'))
          .value;
  Computed<List<City>> _$allCityListComputed;

  @override
  List<City> get allCityList =>
      (_$allCityListComputed ??= Computed<List<City>>(() => super.allCityList,
              name: '_FilterStore.allCityList'))
          .value;

  final _$orderByAtom = Atom(name: '_FilterStore.orderBy');

  @override
  OrderBy get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(OrderBy value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  final _$minPriceAtom = Atom(name: '_FilterStore.minPrice');

  @override
  int get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(int value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  final _$maxPriceAtom = Atom(name: '_FilterStore.maxPrice');

  @override
  int get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(int value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  final _$vendorTypeAtom = Atom(name: '_FilterStore.vendorType');

  @override
  int get vendorType {
    _$vendorTypeAtom.reportRead();
    return super.vendorType;
  }

  @override
  set vendorType(int value) {
    _$vendorTypeAtom.reportWrite(value, super.vendorType, () {
      super.vendorType = value;
    });
  }

  final _$selectedUFAtom = Atom(name: '_FilterStore.selectedUF');

  @override
  UF get selectedUF {
    _$selectedUFAtom.reportRead();
    return super.selectedUF;
  }

  @override
  set selectedUF(UF value) {
    _$selectedUFAtom.reportWrite(value, super.selectedUF, () {
      super.selectedUF = value;
    });
  }

  final _$selectedCityAtom = Atom(name: '_FilterStore.selectedCity');

  @override
  City get selectedCity {
    _$selectedCityAtom.reportRead();
    return super.selectedCity;
  }

  @override
  set selectedCity(City value) {
    _$selectedCityAtom.reportWrite(value, super.selectedCity, () {
      super.selectedCity = value;
    });
  }

  final _$setSelectedStateAsyncAction =
      AsyncAction('_FilterStore.setSelectedState');

  @override
  Future<void> setSelectedState(UF uf) {
    return _$setSelectedStateAsyncAction.run(() => super.setSelectedState(uf));
  }

  final _$_getStateListAsyncAction = AsyncAction('_FilterStore._getStateList');

  @override
  Future<void> _getStateList() {
    return _$_getStateListAsyncAction.run(() => super._getStateList());
  }

  final _$_FilterStoreActionController = ActionController(name: '_FilterStore');

  @override
  void setOrderBy(OrderBy value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinPrice(int value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setMinPrice');
    try {
      return super.setMinPrice(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxPrice(int value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setMaxPrice');
    try {
      return super.setMaxPrice(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectVendorType(int value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.selectVendorType');
    try {
      return super.selectVendorType(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStateList(List<UF> ufs) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setStateList');
    try {
      return super.setStateList(ufs);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCityList(List<City> cities) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setCityList');
    try {
      return super.setCityList(cities);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(City value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
vendorType: ${vendorType},
selectedUF: ${selectedUF},
selectedCity: ${selectedCity},
priceError: ${priceError},
isTypeParticular: ${isTypeParticular},
isFormValid: ${isFormValid},
allStateList: ${allStateList},
allCityList: ${allCityList}
    ''';
  }
}

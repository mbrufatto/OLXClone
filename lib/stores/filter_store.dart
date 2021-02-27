import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/models/city.dart';
import 'package:xlo_clone/models/uf.dart';
import 'package:xlo_clone/repositories/ibge_repository.dart';

import 'home_store.dart';

part 'filter_store.g.dart';

enum OrderBy { DATE, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  _FilterStore({
    this.selectedUF,
    this.selectedCity,
    this.orderBy = OrderBy.DATE,
    this.minPrice,
    this.maxPrice,
    this.vendorType = VENDOR_TYPE_PARTICULAR,
  }) {
    _getStateList();
  }

  ObservableList<UF> stateList = ObservableList<UF>();
  ObservableList<City> cityList = ObservableList<City>();

  @observable
  OrderBy orderBy;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  int minPrice;

  @action
  void setMinPrice(int value) => minPrice = value;

  @observable
  int maxPrice;

  @action
  void setMaxPrice(int value) => maxPrice = value;

  @computed
  String get priceError =>
      maxPrice != null && minPrice != null && maxPrice < minPrice
          ? 'Faixa de preço inválido'
          : null;

  @observable
  int vendorType;

  @action
  void selectVendorType(int value) => vendorType = value;
  void setVendorType(int type) => vendorType = vendorType | type;
  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => (vendorType & VENDOR_TYPE_PARTICULAR) != 0;
  bool get isTypeProfessional => (vendorType & VENDOR_TYPE_PROFESSIONAL) != 0;

  @computed
  bool get isFormValid => priceError == null;

  @observable
  UF selectedUF;

  @action
  Future<void> setSelectedState(UF uf) async {
    try {
      selectedCity = null;
      selectedUF = uf;
      final cities = await IBGERepository().getCityListFromApi(selectedUF);
      cities.removeWhere((element) => element == null);
      setCityList(cities);
    } catch (e) {
      print(e);
    }
  }

  @action
  void setStateList(List<UF> ufs) {
    stateList.clear();
    stateList.addAll(ufs);
  }

  @action
  void setCityList(List<City> cities) {
    cityList.clear();
    cityList.addAll(cities);
  }

  @observable
  City selectedCity;

  @action
  void setCity(City value) {
    selectedCity = null;
    selectedCity = value;
  }

  @computed
  List<UF> get allStateList =>
      List.from(stateList)..insert(0, UF(id: 0, initials: '*', name: 'Todos'));

  @computed
  List<City> get allCityList =>
      List.from(cityList)..insert(0, City(id: 0, name: 'Todas'));

  @action
  Future<void> _getStateList() async {
    try {
      stateList.clear();
      final states = await IBGERepository().getUFList();
      setStateList(states);
      _selectedItem();
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> _selectedItem() async {
    if (selectedUF != null && selectedUF.name != 'Todos') {
      final UF currentSelectedUf = selectedUF;
      selectedUF = null;
      final List<UF> currentUf = await allStateList
          .where((element) => element.name == currentSelectedUf.name)
          .toList();
      setSelectedState(currentUf.first);
    }
  }

  void save() {
    GetIt.I<HomeStore>().setFilter(this);
  }

  FilterStore clone() {
    return FilterStore(
      selectedUF: selectedUF,
      selectedCity: selectedCity,
      orderBy: orderBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
      vendorType: vendorType,
    );
  }
}

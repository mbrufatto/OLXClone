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

  @observable
  UF selectedUF;

  @action
  Future<void> _getStateList() async {
    try {
      final states = await IBGERepository().getUFList();
      setStateList(states);
    } catch (e) {
      print(e);
    }
  }

  void setStateList(List<UF> ufs) {
    stateList.clear();
    stateList.addAll(ufs);
    stateList.insert(0, UF(id: 0, initials: '*', name: 'Todos'));
    getCityList(selectedUF);
  }

  Future<void> getCityList(UF uf) async {
    try {
      cityList.clear();
      if (selectedCity != null && selectedUF != uf) {
        selectedCity = null;
        selectedUF = uf;
      }
      final cities = await IBGERepository().getCityListFromApi(uf);
      setCityList(cities);
    } catch (e) {
      print(e);
    }
  }

  @observable
  City selectedCity;

  void setCityList(List<City> cities) {
    cityList.addAll(cities);
    cityList.insert(0, City(id: 0, name: 'Todas'));
  }

  @action
  void setCity(City value) => selectedCity = value;
}

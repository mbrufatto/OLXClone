import 'package:xlo_clone/models/city.dart';
import 'package:xlo_clone/models/uf.dart';

class Address {
  UF uf;
  City city;

  String cep;
  String district;

  Address({this.uf, this.city, this.cep, this.district});
}

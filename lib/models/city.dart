class City {
  final int id;
  final String name;

  const City({this.id, this.name});

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        name: json['nome'],
      );

  @override
  bool operator ==(other) {
    return (other is City) && other.name == name && other.id == id;
  }

  @override
  int get hashCode => super.hashCode;
}

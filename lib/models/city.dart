class City {
  final int id;
  final String name;

  const City({this.id, this.name});

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        name: json['nome'],
      );

  bool operator ==(dynamic other) =>
      other != null &&
      other is City &&
      this.id == other.id &&
      this.name == other.name;

  @override
  int get hashCode => super.hashCode;
}

class UF {
  final int id;
  final String initials;
  final String name;

  UF({this.id, this.initials, this.name});

  factory UF.fromJson(Map<String, dynamic> json) => UF(
        id: json['id'],
        initials: json['sigla'],
        name: json['nome'],
      );

  bool operator ==(dynamic other) =>
      other != null &&
      other is UF &&
      this.id == other.id &&
      this.initials == other.initials &&
      this.name == other.name;

  @override
  int get hashCode => super.hashCode;
}

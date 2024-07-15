class Languages {
  String? id;
  late String languageName;
  late String languageIcon;

  Languages({
    this.id,
    required this.languageName,
    required this.languageIcon,
  });

  Languages.fromMap(Map map) {
    id = map["_id"];
    languageName = map["languageName"];
    languageIcon = map["languageIcon"];
  }

  Languages.defaultGetX();

  Map<String, dynamic> toMap() => {
    "_id": id,
    "languageName": languageName,
    "languageIcon": languageIcon,
  };
}

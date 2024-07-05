class Lesson {
  String? title;
  late List<dynamic> exercices = List<dynamic>.empty(growable: true);

  Lesson({
    required this.title,
    required this.exercices,
  });

  Lesson.fromMap(Map map) {
    title = map["title"];
    exercices = map["exercices"];
  }

  Map<String, dynamic> toMap() => {
    "title": title,
    "exercices": exercices,
  };
}

import 'dart:ffi';

class Exercice {
  String? title;
  late List<dynamic> rightAnswer = List<dynamic>.empty(growable: true);
  late List<dynamic> wrongAnswer = List<dynamic>.empty(growable: true);
  late List<dynamic> possibleAnswers = List<dynamic>.empty(growable: true);
  Bool? isQuention;

  Exercice({
    required this.title,
    required this.isQuention,
    required this.rightAnswer,
    required this.wrongAnswer,
    required this.possibleAnswers,
  });

//TODO verificar se precisa do ID
  Exercice.fromMap(Map map) {
    title = map["title"];
    rightAnswer = map["rightAnswer"];
    wrongAnswer = map["wrongAnswer"];
    possibleAnswers = map["possibleAnswers"];
    isQuention = map["isQuestion"];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "rightAnswer": rightAnswer,
        "wrongAnswer": wrongAnswer,
        "possibleAnswers": possibleAnswers,
        "isQuestion": isQuention,
      };
}

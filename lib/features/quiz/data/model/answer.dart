
class Answer {
  final String answer;
  final bool isCorrect;

  Answer(this.answer, this.isCorrect);

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      map['answer'] ?? '',
      map['isCorrect'] ?? false,
    );
  }

}
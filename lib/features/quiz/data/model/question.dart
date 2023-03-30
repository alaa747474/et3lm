
import 'package:e_learning_app/features/quiz/data/model/answer.dart';

class Question {
  final String question;
  final List<Answer>answers;

  Question(this.question, this.answers);

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answers':answers.map((e) =>e.toMap()).toList()
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      map['question'] ?? '',
      (map['answers'] as List).map((e) => Answer.fromMap(e)).toList()
    );
  }


}

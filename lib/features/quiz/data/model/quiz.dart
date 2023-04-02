
class Quiz {
  final String subjectName;
  final String description;
  final String quizId;
  final int time;
  final int numberOfQuestions;
  Quiz(this.subjectName, this.description, this.quizId,this.time,this.numberOfQuestions);

  Map<String, dynamic> toMap() {
    return {
      'subjectName': subjectName,
      'description': description,
      'quizId': quizId,
      'time':time,
      'numberOfQuestions':numberOfQuestions
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      map['subjectName'] ?? '',
      map['description'] ?? '',
      map['quizId'] ?? '',
      map['time']??'',
      map['numberOfQuestions']
    );
  }
}

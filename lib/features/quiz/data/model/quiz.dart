
class Quiz {
  final String subjectName;
  final String description;
  final String quizId;
  final int time;
  Quiz(this.subjectName, this.description, this.quizId,this.time);

  Map<String, dynamic> toMap() {
    return {
      'subjectName': subjectName,
      'description': description,
      'quizId': quizId,
      'time':time
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      map['subjectName'] ?? '',
      map['description'] ?? '',
      map['quizId'] ?? '',
      map['time']??''
    );
  }
}

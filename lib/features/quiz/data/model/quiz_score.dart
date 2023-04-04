
class QuizScore {
  final double score;
  final dynamic total;
  final String subjectName;
  final String quizId;

  QuizScore(this.score, this.total, this.subjectName, this.quizId);

 

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'total': total,
      'subjectName': subjectName,
      'quizId': quizId,
    };
  }

  factory QuizScore.fromMap(Map<String, dynamic> map) {
    return QuizScore(
      map['score']?.toDouble() ?? 0.0,
      map['total']?.toDouble() ?? 0,
      map['subjectName'] ?? '',
      map['quizId'] ?? '',
    );
  }


}

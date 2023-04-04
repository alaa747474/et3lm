
import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz {
  final String subjectName;
  final String description;
  final String quizId;
  final int time;
  final int numberOfQuestions;
  final Timestamp startAt;
   List<dynamic>?enteredQuizStudents;
  Quiz(this.subjectName, this.description, this.quizId,this.time,this.numberOfQuestions,this.startAt,this.enteredQuizStudents);

  Map<String, dynamic> toMap() {
    return {
      'subjectName': subjectName,
      'description': description,
      'quizId': quizId,
      'time':time,
      'numberOfQuestions':numberOfQuestions,
      'startAt':startAt
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      map['subjectName'] ?? '',
      map['description'] ?? '',
      map['quizId'] ?? '',
      map['time']??'',
      map['numberOfQuestions'],
      map['startAt']??'',
      map['enteredQuizStudents']
    );
  }
}

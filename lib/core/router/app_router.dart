import 'package:e_learning_app/core/utils/service_locator.dart';
import 'package:e_learning_app/features/auth/presentation/screens/create_account_screen.dart';
import 'package:e_learning_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_learning_app/features/home/presentation/screens/home_screen.dart';
import 'package:e_learning_app/features/lectures/business_logic/cubit/lectures_cubit.dart';
import 'package:e_learning_app/features/lectures/data/model/lecture.dart';
import 'package:e_learning_app/features/lectures/data/repository/lecture_repository.dart';
import 'package:e_learning_app/features/lectures/presentation/screens/lecture_pdf_viewr_screen.dart';
import 'package:e_learning_app/features/lectures/presentation/screens/lecture_video_viewer_screen.dart';
import 'package:e_learning_app/features/lectures/presentation/screens/lectures_screen.dart';
import 'package:e_learning_app/features/quiz/business_logic/answers_cubit/answers_cubit.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/presentation/screens/question_screen.dart';
import 'package:e_learning_app/features/subjects/data/model/subject.dart';
import 'package:e_learning_app/features/subjects/presentation/screens/subjects_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case QuestionScreen.routeName:
        final quiz = settings.arguments as Quiz;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      AnswersCubit()..startTimer(quiz.time * 60),
                  child: QuestionScreen(
                    quiz: quiz,
                  ),
                ));
      case CreateAccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case SignInScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case SubjectsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SubjectsScreen());
      case LecturePdfViewerScreen.routeName:
        final lecture = settings.arguments as Lecture;
        return MaterialPageRoute(
            builder: (_) => LecturePdfViewerScreen(lecture: lecture));
      case LectureVideoViewerScreen.routeName:
        final lecture = settings.arguments as Lecture;
        return MaterialPageRoute(
            builder: (_) => LectureVideoViewerScreen(lecture: lecture));
      case LecturesScreen.routeName:
        final subject = settings.arguments as Subject;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      LecturesCubit(getIt.get<LectureRepository>())
                        ..getAllLectures(subjectName: subject.name),
                  child: LecturesScreen(
                    subject: subject,
                  ),
                ));
    }
    return null;
  }
}

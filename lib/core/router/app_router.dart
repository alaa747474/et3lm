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
import 'package:e_learning_app/features/profile/business_logic/cubit/profile_cubit.dart';
import 'package:e_learning_app/features/profile/data/repository/profile_repository.dart';
import 'package:e_learning_app/features/profile/presentation/screens/quiz_results_screen.dart';
import 'package:e_learning_app/features/quiz/business_logic/answers_cubit/answers_cubit.dart';
import 'package:e_learning_app/features/quiz/data/model/quiz.dart';
import 'package:e_learning_app/features/quiz/data/repository/quiz_repository.dart';
import 'package:e_learning_app/features/quiz/presentation/screens/question_screen.dart';
import 'package:e_learning_app/features/quiz/presentation/screens/quiz_score_screen.dart';
import 'package:e_learning_app/features/subjects/data/model/subject.dart';
import 'package:e_learning_app/features/subjects/presentation/screens/subjects_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case QuizzesResultsScreen.routeName:
        return MaterialPageRoute(
            builder: (_) =>  BlocProvider(
                  create: (context) => ProfileCubit(getIt.get<ProfileRepository>()),
                  child: const QuizzesResultsScreen(),
                ));
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case QuestionScreen.routeName:
        final quiz = settings.arguments as Quiz;

        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AnswersCubit(getIt.get<QuizRepository>())
                    ..startTimer(quiz.time * 60)
                    ..createAnswersList(quiz.numberOfQuestions),
                  child: QuestionScreen(
                    quiz: quiz,
                  ),
                ));
      case CreateAccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case QuizScoreScreen.routeName:
        final quizScore = settings.arguments as QuizScoreScreen;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: AnswersCubit(getIt.get<QuizRepository>()),
                  child: QuizScoreScreen(
                    quizScore: quizScore.quizScore,
                    totalQuestions: quizScore.totalQuestions,
                  ),
                ));
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

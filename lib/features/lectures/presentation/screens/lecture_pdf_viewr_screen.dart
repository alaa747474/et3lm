import 'package:e_learning_app/core/widgets/custom_appbar.dart';
import 'package:e_learning_app/features/lectures/data/model/lecture.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LecturePdfViewerScreen extends StatelessWidget {
  const LecturePdfViewerScreen({super.key, required this.lecture});
  final Lecture lecture;
  static const String routeName ='/lecture_pdf_viewer_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: lecture.name!, onPressed: ()=>Navigator.pop(context)),
      body: SfPdfViewer.network(lecture.pdf!,)
    );
  }
}
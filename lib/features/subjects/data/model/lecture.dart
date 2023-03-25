
class Lecture {
  final String name;
  final String pdfUrl;

  Lecture(this.name, this.pdfUrl);

  factory Lecture.fromMap(Map<String, dynamic> map) {
    return Lecture(
      map['name'] ?? '',
      map['pdfUrl'] ?? '',
    );
  }

}

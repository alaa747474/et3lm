
class Lecture {
  final String ?name;
  final String ?video;
  final String ?pdf;

  Lecture(this.name, this.video, this.pdf);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'video': video,
      'pdf': pdf,
    };
  }

  factory Lecture.fromJson(Map<String, dynamic> map) {
    return Lecture(
      map['name'] ?? '',
      map['video'] ?? '',
      map['pdf'] ?? '',
    );
  }

}

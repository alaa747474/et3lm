
class Subject {
  final String name;
  final String image;

  Subject(this.name, this.image);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Subject.fromJson(Map<String, dynamic> map) {
    return Subject(
      map['name'] ?? '',
      map['image'] ?? '',
    );
  }
}

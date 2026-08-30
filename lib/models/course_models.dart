class CourseModels {
  String? image;
  String? title;
  String? duration;
  String? level;
  double? rating;

  CourseModels({this.duration, this.image, this.level, this.rating, this.title});

  factory CourseModels.fromJson(Map<String, dynamic> json) {
    return CourseModels(
      image: json['image'] ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original',
      title: json['title'] ?? 'Course',
      duration: json['duration'] ?? 'Unknown duration',
      level: json['level'] ?? 'Beginner',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
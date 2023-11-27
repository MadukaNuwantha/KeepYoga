import 'package:keepyoga/models/lesson.dart';

class Session {
  String? id;
  String? title;
  String? instructor;
  String? category;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imageUrl;
  List<Lesson>? lessons;

  Session({
    this.id,
    this.title,
    this.instructor,
    this.category,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.lessons,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        title: json["title"],
        instructor: json["instructor"],
        category: json["category"],
        image: json["image"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        imageUrl: json["imageUrl"],
        lessons: json["lessons"] == null ? [] : List<Lesson>.from(json["lessons"]!.map((x) => Lesson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "instructor": instructor,
        "category": category,
        "image": image,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "imageUrl": imageUrl,
        "lessons": lessons == null ? [] : List<dynamic>.from(lessons!.map((x) => x.toJson())),
      };
}

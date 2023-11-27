class Lesson {
  String? id;
  String? title;
  String? description;
  String? video;
  String? sessionId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? videoUrl;

  Lesson({
    this.id,
    this.title,
    this.description,
    this.video,
    this.sessionId,
    this.createdAt,
    this.updatedAt,
    this.videoUrl,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        video: json["video"],
        sessionId: json["sessionId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        videoUrl: json["videoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "video": video,
        "sessionId": sessionId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "videoUrl": videoUrl,
      };
}

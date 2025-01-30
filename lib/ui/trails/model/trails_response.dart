class TrailResponse {
  final String id;
  final String title;
  final String description;
  final List<String> contents;
  final DateTime createdAt;
  final DateTime updatedAt;

  TrailResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.contents,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TrailResponse.fromJson(Map<String, dynamic> json) {
    return TrailResponse(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      contents: List<String>.from(json['contents']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

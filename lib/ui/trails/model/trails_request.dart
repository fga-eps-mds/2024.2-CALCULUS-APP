import 'dart:convert';

class TrailsRequest {
  final String title;
  final String description;
  final List<String> contents;

  TrailsRequest({
    required this.title,
    required this.description,
    required this.contents,
  });

  // Método para converter o objeto em um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'contents': contents,
    };
  }
}

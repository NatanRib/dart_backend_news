import '../core/archtectural_contracts/model.dart';

class NewsModel {
  int id;
  String title;
  String description;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'id: $id, title: $title, description: $description, '
        'createdAt: $createdAt, updatedAt: $updatedAt, imageUrl: $imageUrl';
  }
}

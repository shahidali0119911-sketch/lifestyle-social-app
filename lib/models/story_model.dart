class StoryModel {
  final String id;
  final String userId;
  final String imageUrl;
  final String createdAt;

  const StoryModel({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }
}

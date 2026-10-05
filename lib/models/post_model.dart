class PostModel {
  final String id;
  final String userId;
  final String caption;
  final String imageUrl;
  final String createdAt;
  final int likes;
  final int comments;

  const PostModel({
    required this.id,
    required this.userId,
    required this.caption,
    required this.imageUrl,
    required this.createdAt,
    required this.likes,
    required this.comments,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'caption': caption,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'likes': likes,
      'comments': comments,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      caption: map['caption'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      createdAt: map['createdAt'] ?? '',
      likes: map['likes'] ?? 0,
      comments: map['comments'] ?? 0,
    );
  }
}

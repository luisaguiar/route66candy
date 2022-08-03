class Review {
  final int id;
  final BigInt productId;
  final int userId;
  final String? comment;
  final double? rating;
  final int status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Review(
      {required this.id,
      required this.productId,
      required this.userId,
      this.comment,
      this.rating,
      required this.status,
      this.createdAt,
      this.updatedAt});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      productId: json['product_id'],
      userId: json['user_id'],
      comment: json['comment'],
      rating: json['rating'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }
}

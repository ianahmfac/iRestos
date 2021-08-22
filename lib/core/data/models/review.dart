class Review {
  final String name;
  final String review;
  final String date;
  Review({
    required this.name,
    required this.review,
    required this.date,
  });

  Map<String, dynamic> toMap(String id) {
    return {
      'id': id,
      'name': name,
      'review': review,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      name: map['name'],
      review: map['review'],
      date: map['date'],
    );
  }
}

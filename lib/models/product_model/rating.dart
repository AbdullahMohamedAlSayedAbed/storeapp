class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic>? json) {
    return Rating(
      rate: (json?['rate'] as num?)?.toDouble() ?? 0.0,
      count: json?['count'] as int? ?? 0,
    );
  }
}

class Place {
  final String title;
  final String price;
  final String rating;
  final String description;
  final String thumbnail;

  Place({
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.thumbnail,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      title: json['title'],
      price: json['price'],
      rating: json['rating'],
      description: json['description'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'rating': rating,
      'description': description,
      'thumbnail': thumbnail,
    };
  }
}

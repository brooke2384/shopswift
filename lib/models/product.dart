class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? discountPrice;
  final String image;
  final double rating;
  final int reviews;
  final bool isWishlisted;
  final String? category;
  final List<String>? tags;
  final List<String>? colors;
  final List<String>? sizes;
  final List<String>? variants;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.discountPrice,
    required this.image,
    required this.rating,
    required this.reviews,
    this.isWishlisted = false,
    this.category,
    this.tags,
    this.colors,
    this.sizes,
    this.variants,
  });
}

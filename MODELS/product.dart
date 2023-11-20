
class Product {
  final int id;
  final List<String> imageUrls;
  final String title;
  final String description;
  final int oprice;
  final int nprice;
  final int discount;
  final int numberOfPeopleBought;
  final int total_quantity_of_p;
  List<SizeDetails> sizes;
  int count_in_cart;


  Product({
    required this.id,
    required this.imageUrls,
    required this.title,
    required this.description,
    required this.oprice,
    required this.nprice,
    required this.discount,
    required this.numberOfPeopleBought,
    required this.total_quantity_of_p,
    required this.sizes,
    required this.count_in_cart,

  });

  factory Product.fromFirestore(Map<String, dynamic> data, List<SizeDetails> sizes, List<String> imageUrls) {
    return Product(
      id: _parseInteger(data['id']),
        imageUrls: imageUrls,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      oprice: _parseInteger(data['oprice']),
      nprice: _parseInteger(data['nprice']),
      discount: _parseInteger(data['discount']),
      numberOfPeopleBought: _parseInteger(data['numberOfPeopleBought']),
      total_quantity_of_p: _parseInteger(data['total_quantity_of_p']),
      sizes: sizes,
      count_in_cart: _parseInteger(data['count_in_cart']),

    );
  }

  // Helper function to parse integer or return 0 for empty strings

  static int _parseInteger(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String && value.isNotEmpty) {
      return int.tryParse(value) ?? 0;
    } else {
      return 0;
    }
  }

}


class SizeDetails {
  final String size;
  final int availableItems;

  SizeDetails({
    required this.size,
    required this.availableItems,
  });

  factory SizeDetails.fromMap(Map<String, dynamic> data) {
    return SizeDetails(
      size: data['size'] ?? '',
      availableItems: data['availableItems'] ?? 0,
    );
  }
}






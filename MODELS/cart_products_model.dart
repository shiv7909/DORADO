
class Product {

  final int id;
  String image; // Store only one image link
  final String title;
  final String description;
  final int oprice;
  final int nprice;
  final int discount;
  int quantity;
  String size;
   Map<String, int> sizesAvailableItems;
  bool stockExists;
  int stock;


  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.oprice,
    required this.nprice,
    required this.discount,
    this.quantity = 0,
    this.size = '',
    this.sizesAvailableItems = const {},
    this.stockExists = false,
    this.stock=0,
    this.image = '', required No_of_Variations, required color, required imagepath, required Quantity, // Initialize with an empty string
  });
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





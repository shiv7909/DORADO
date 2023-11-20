


class CartIcon {

  final String imageUrl;
  CartIcon({required this.imageUrl});

  factory CartIcon.fromMap(Map<String, dynamic> data) {
    return CartIcon(
      imageUrl: data['image'] ?? '',
    );
  }
}




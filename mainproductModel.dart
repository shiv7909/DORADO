


class ParticularProduct {
  final String id;
  final String Title;
  final String Description;
  final int No_of_Variations;

  final int oprice;
  final int nprice;
  final int discount;
  final String color;

  final List<String> images;
  final int Quantity;
  // final String vid;

  ParticularProduct ({
    required this.id,
    required this.Title,
    required this.Description,
    required this.No_of_Variations,

    required this.oprice,
    required this.nprice,
    required this.discount,
    required this.color,

    required this.Quantity,
    required this.images,
    // required this.vid,

  });

}
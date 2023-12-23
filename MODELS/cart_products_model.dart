
class CartProduct {

  final String id;
  final String Title;
  final String Description;
 // final int No_of_Variations;
  final String variationid;

  final int oprice;
  final int nprice;
  final int discount;
  final String color;

  String imagepath;
  final int Quantity_in_stock;

  final int  Quantity_in_cart;
  final String size;

  CartProduct({
    required this.id,
    required this.Title,
    required this.Description,
  //  required this.No_of_Variations,
    required this.variationid,

    required this.oprice,
    required this.nprice,
    required this.discount,
    required this.color,

    required this.imagepath,
    required this.Quantity_in_stock,


    required this.Quantity_in_cart,
    required this.size,

  });

}






class Cart{
  final String id;
  final String name;
  final String category;
  final String price;
  final String quantity;
  final String? image;

  Cart({
    required this.id, required this.name, required this.category,
    required this.price, required this.quantity, this.image
  });

}
class Cart{
  final String id;
  final String name;
  final String category;
  final num price;
  late final int quantity;
  final String? image;

  Cart({
    required this.id, required this.name, required this.category,
    required this.price, required this.quantity, this.image
  });

}
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }

  // Create a Cart object from a map
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'],
      quantity: json['quantity'],
      image: json['image'],
    );
  }

}
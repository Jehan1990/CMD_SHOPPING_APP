class Product {
  //properties
  final int id;
  final String name;
  final double price;
  //constructor
  const Product({required this.id, required this.name, required this.price});
  //getter initial is a method to get the first charecter of the product name
  String get initial => name.substring(0, 1);
  //getter display name is a method to get name and price of the product
  //by concatinating string using initial getter.
  String get displayName => '($initial)${name.substring(1)} :\$$price';
}
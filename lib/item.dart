
import 'product.dart';

class Item {
  //constructor
  const Item({required this.product, this.quantity = 1});
  //properties
  final Product product;
  final int quantity;
  //getter
  double get price => quantity * product.price;

  @override
  String toString() => '$quantity x ${product.name} \$$price';
}

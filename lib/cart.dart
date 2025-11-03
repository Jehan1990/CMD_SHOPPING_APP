import 'item.dart';
import 'product.dart';

class Cart {
  final Map<int, Item> _item = {};

  bool get isEmpty=>_item.isEmpty;

  void addProduct(Product product) {
    final item = _item[product.id];
    if (item == null) {
      _item[product.id] = Item(product: product, quantity: 1);
    } else {
      _item[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  double total() => _item.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);

  @override
  String toString() {
    if (_item.isEmpty) {
      return 'Cart is empty';
    }
    final itemisedList = _item.values.map((item) => item.toString()).join('\n');
    return '$itemisedList\nTotal: \$${total()}\n------------\n';
  }
}

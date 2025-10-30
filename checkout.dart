import 'dart:io';

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

class Cart {
  final Map<int, Item> _item = {};

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

//allProduct list with Product objects
const allProducts = [
  Product(id: 1, name: 'apples', price: 1.6),
  Product(id: 2, name: 'bananas', price: 0.7),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.0),
  Product(id: 5, name: 'mushrooms', price: 0.8),
  Product(id: 6, name: 'potatoes', price: 1.5),
];

/*sudo code:-
loop,
prompt: view cart/add item/checkout
if selection is == view cart
  choose a product
  add to cart
  print cart
if selection is == add item
  print cart
if selection is == checkout
  do checkout
  exit
end
*/

void main() {
  final cart = Cart();
  while (true) {
    //writes the first line of question to ask user what they want to do.
    //It uses dart libray dart:io for stdout=standard_output
    stdout.write('''(v)iew item,\n(a)dd item,\n(c)heckout,\n(q)uit
What do you want to do? ''');
    //reads user input using stdin.readLineSync() from dart:io libray
    final line = stdin.readLineSync();
    //perform conditional logic using user input and chooseProduct() function.
    if (line == 'a') {
      final product = chooseProduct();
      if (product != null) {
        cart.addProduct(product);
        print('\n----CART----\n$cart');
      }
    } else if (line == 'v') {
      print('\n----CART----\n$cart');
    } else if (line == 'c') {
      //TODO:implement
    } else if (line == 'q') {
      break;
    } else {
      print('Wrong Input selected');
    }
  }
}

//Function chooseProduct() which returns Product which is nullable
Product? chooseProduct() {
  final productList = allProducts
      .map((product) => product.displayName)
      .join('\n'); //productList is of type String(multiline)

  //Display the product list for the user to choose the items in the cart
  stdout.write('\nAvailable Products:\n$productList\n\nYour Choice: ');
  //reads the user input
  final line = stdin.readLineSync();
  for (var product in allProducts) {
    if (line == product.initial) {
      return product;
    }
  }
  print('Item not found');
  return null;
}

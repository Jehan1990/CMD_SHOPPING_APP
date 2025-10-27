import 'dart:io';

class Product {
  //properties
  final int id;
  final String name;
  final double price;
  //constructor
  const Product({required this.id, required this.name, required this.price});
  //getter
  String get initial=>name.substring(0,1);
  String get displayName=>'($initial)${name.substring(1)} :\$$price';

}


class Item {
  //constructor
  const Item({required this.product, this.quantity = 1});
  //properties
  final Product product;
  final int quantity;
  //getter
  double get price => quantity * product.price;
}

class Cart {
  //TODO:Item collection
}

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
  while (true) {
    stdout.write(
      'What do you want to do? (v)iew item, (a)dd item, (c)heckout ',
    );
    final line = stdin.readLineSync();
    if (line == 'a') {
      final product=chooseProduct();
      if(product !=null){
        print(product.displayName);
      }
    } else if (line == 'v') {
      //TODO:implement
    } else if (line == 'c') {
      //TODO:implement
    } else {
      print('Wrong input selected');
    }
  }
}

Product? chooseProduct(){
  final productList=
        allProducts.map((product)=>product.displayName).join('\n');
  stdout.write('Available Products:\n$productList\nYour Choice: ');
  final line=stdin.readLineSync();
  for(var product in allProducts){
    if(line==product.initial){
      return product;
    }
  }
  print('Not found');
  return null;
}

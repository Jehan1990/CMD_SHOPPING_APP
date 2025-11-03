
import 'dart:io';

import '../lib/cart.dart';
import '../lib/product.dart';


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
      if(checkout(cart)){
        break;
      }
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


bool checkout(Cart cart){
  
  if(cart.isEmpty){
    print('Cart is empty\n');
    return false;
  }
  
  final total=cart.total();
  print('Total: \$$total');
  
  stdout.write('Payment in cash \$');
  
  final line=stdin.readLineSync();
  if(line==null || line.isEmpty){
    return false;
  }
  final paid=double.tryParse(line);
  if(paid==null){
    return false;
  }

  if(paid>=total){
    final change=paid-total;
    print('Change:  \$${change.toStringAsFixed(2)}');
    return true;
  }else{
    print('Not enough cash');
    return true;
  }

}
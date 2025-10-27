import 'dart:io';

class Product {
  //properties
  final int id;
  final String name;
  final double price;
  //constructor
  const Product({required this.id, required this.name, required this.price});
}

class Item{
  //constructor
  const Item({required this.product, this.quantity=1});
  //properties
  final Product product;
  final int quantity;
  //getter
  double get price=>quantity*product.price;
}

class Cart{
  //TODO:Item collection
}

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

void main(){
  while(true){
    stdout.write(
      'What do you want to do? (v)iew item, (a)dd item, (c)heckout');
    final line=stdin.readLineSync();
    if(line=='a'){

    }else if(line=='v'){

    }else if(line=='c'){
      
    }
  }
}

import 'package:e_commerce/const/product.dart';
class Appdata{
 static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Nike Air 200',
        price: 240,
        image: 'assets/thumbnail/model.png',
        quantity: 1,
        size: 40.2,
        isselected: true,
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Max 97',
        price: 190,
        image: 'assets/thumbnail/model2.png',
        quantity: 1,
        isselected: true,
        size: 30.2,
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'Air Max 92607',
        price: 220,
        quantity: 1,
        size: 20.2,
        isselected: true,
        image: 'assets/thumbnail/model.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max',
        price: 240,
        isselected: true,
        image: 'assets/thumbnail/model2.png',
        quantity: 1,
        size: 1.2,
        category: "Trending Now"),
  ];
}

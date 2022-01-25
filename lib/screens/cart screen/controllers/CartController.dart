import 'package:e_commerce/const/cart_data.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  static double initialTotal=getInitialTotal();
  var total = (initialTotal).obs;
  void incrementPrice(int price) => total.value += price ;
  void decrementPrice(int price) => total.value -= price ;
  static int initialItems=Appdata.cartList.length;
  var noOfItems=initialItems.obs;
  void incrementItems(int currItems)=>noOfItems.value+=currItems;
  void decrementItems(int currItems)=>noOfItems.value-=currItems;
}
double getInitialTotal(){
  var initialTotal=0.0;
  var item=List.from(Appdata.cartList);
  for(int i=0;i<item.length;i++){
    initialTotal+=item[i].price;
  }
  return initialTotal;
}
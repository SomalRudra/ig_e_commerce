import 'package:e_commerce/const/cart_data.dart';
import 'package:e_commerce/const/for_all_size.dart';
import 'package:e_commerce/widgets/cart_item.dart';
import 'package:e_commerce/widgets/proceed_to_checkout.dart';
import 'package:e_commerce/widgets/top_bar.dart';
import 'package:e_commerce/widgets/budget.dart';
import 'package:flutter/material.dart';
class CartScreen extends StatelessWidget {
  final items=List.from(Appdata.cartList);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            TopBar(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context,index)=> Container(
                margin:EdgeInsets.only(left: SizeConfig.getScreenSize(context).width*0.042,right: SizeConfig.getScreenSize(context).width*0.021),
                  child: CartItem(index: index,product: items[index],),
              ),),

            ),
            Budget(),
            ProceedToCheckout(),
          ],
        ),
      ),
    );
  }
}

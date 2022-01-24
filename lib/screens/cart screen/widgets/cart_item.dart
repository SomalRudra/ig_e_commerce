import 'package:e_commerce/const/cart_data.dart';
import 'package:e_commerce/const/for_all_size.dart';
import 'package:e_commerce/const/product.dart';
import 'package:e_commerce/controllers/CartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatefulWidget {
  final int index;
  final Product product;
  const CartItem({Key? key, required this.index, required this.product})
      : super(key: key);
  @override
  _CartItemState createState() => new _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final items = List.from(Appdata.cartList);
  final CartController _cartController = Get.find();
  bool isOpen = true;
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return isOpen
        ? Container(
            margin: EdgeInsets.only(top: 10, bottom: 10,right: 5),
            child: Row(
              children: <Widget>[
                Container(
                  height: SizeConfig.getScreenSize(context).width * 0.21,
                  width: SizeConfig.getScreenSize(context).width * 0.21,
                  margin: EdgeInsets.only(right: SizeConfig.getScreenSize(context).width * 0.05),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(widget.product.image),
                ),
                Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyle(
                                fontSize: SizeConfig.getScreenSize(context).width*0.04, fontWeight: FontWeight.w700),
                          ),
                          Text(("Size: " + widget.product.size.toString()),
                              style: TextStyle(
                                  fontSize: SizeConfig.getScreenSize(context).width*0.034, fontWeight: FontWeight.w300)),
                          SizedBox(
                            height: SizeConfig.getScreenSize(context).width*0.034,
                          ),
                          Row(
                            children: <Widget>[
                              Text('Rs ',
                                  style: TextStyle(
                                      fontSize: SizeConfig.getScreenSize(context).width*0.036,
                                      fontWeight: FontWeight.w700)),
                              Text(widget.product.price.toString(),
                                  style: TextStyle(
                                      fontSize: SizeConfig.getScreenSize(context).width*0.04,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isOpen = false;
                                    items.remove(widget.product);
                                    _cartController.decrementItems(counter);
                                    _cartController.decrementPrice(
                                        widget.product.price * (counter));
                                    widget.product.isselected=false;
                                  });
                                },
                                padding: EdgeInsets.only(bottom: SizeConfig.getScreenSize(context).width * 0.07),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: SizeConfig.getScreenSize(context).width*0.045,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (counter > 1) {
                                      counter--;
                                      _cartController.decrementItems(1);
                                      widget.product.quantity-=1;
                                      _cartController
                                          .decrementPrice(widget.product.price);
                                    }
                                  });
                                },
                                padding: EdgeInsets.only(right: 10),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.black,
                                  size: SizeConfig.getScreenSize(context).width*0.065,
                                ),
                              ),
                              Text(counter.toString(),
                                  style: TextStyle(
                                    fontSize: SizeConfig.getScreenSize(context).width*0.04,
                                  )),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (counter < 10) {
                                      counter++;
                                      _cartController.incrementItems(1);
                                      widget.product.quantity+=1;
                                      _cartController
                                          .incrementPrice(widget.product.price);
                                    }
                                  });
                                },
                                padding: EdgeInsets.only( left: 10),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                  size: SizeConfig.getScreenSize(context).width*0.065,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]))
              ],
            ),
          )
        : Container();
  }
}

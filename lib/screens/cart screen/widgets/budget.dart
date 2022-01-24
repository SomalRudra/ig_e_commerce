import 'package:e_commerce/const/for_all_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:e_commerce/controllers/CartController.dart';

class Budget extends StatelessWidget {
  final double shipping = 50.0;
  final TextEditingController myTextEditingController = TextEditingController();
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(
                vertical: SizeConfig.getScreenSize(context).height * 0.025),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            height: SizeConfig.getScreenSize(context).height * 0.077,
            width: SizeConfig.getScreenSize(context).width * 0.92,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: TextField(
                      controller: myTextEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Promo Code',
                      )),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text("Apply",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      padding:
                          EdgeInsets.symmetric(vertical: 11, horizontal: 23),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: SizeConfig.getScreenSize(context).height * 0.014),
            height: SizeConfig.getScreenSize(context).height * 0.18,
            width: SizeConfig.getScreenSize(context).width * 0.92,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text("Subtotal")],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Obx(() => Text(cartController.total.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ))),
                            Text(" INR",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.white,
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text("Shipping")],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => (cartController.total > 0.0)
                                  ? Text(shipping.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ))
                                  : Text("0",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      )),
                            ),
                            Text(" INR",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.white,
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text("Bag Total")],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Obx(() => Text(
                                "( " +
                                    cartController.noOfItems.toString() +
                                    " items)  ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ))),
                            Obx(() => (cartController.total > 0.0)
                                ? Text(
                                    (shipping + cartController.total.toDouble())
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ))
                                : Text("0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ))),
                            Text(" INR",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

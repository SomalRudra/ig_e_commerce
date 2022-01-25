import 'package:e_commerce/const/for_all_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/controllers/CartController.dart';

class TopBar extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: SizeConfig.getScreenSize(context).height * 0.032,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: SizeConfig.getScreenSize(context).height * 0.008,
              ),
              Text(
                "Shopping Bag",
                style: TextStyle(
                  fontSize: SizeConfig.getScreenSize(context).height * 0.018,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:7,
                        vertical:7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: SizeConfig.getScreenSize(context).height * 0.027,
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left:22),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        height:14,
                        width: 14,
                        alignment: Alignment.center,
                        child:
                            Obx(() => Text(cartController.noOfItems.toString(),
                                style: TextStyle(
                                  fontSize:10,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

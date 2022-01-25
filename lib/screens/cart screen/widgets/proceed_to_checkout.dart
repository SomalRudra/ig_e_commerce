import 'package:e_commerce/const/cart_data.dart';
import 'package:e_commerce/controllers/CartController.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/const/for_all_size.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart';
class ProceedToCheckout extends StatelessWidget {
  const ProceedToCheckout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: SizeConfig.getScreenSize(context).height * 0.06,
          top: SizeConfig.getScreenSize(context).height * 0.04),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {
            final String data=stringToShare();
            if(defaultTargetPlatform==TargetPlatform.android||defaultTargetPlatform==TargetPlatform.iOS){
            Share.share(data);}
            else {
              openWhatsapp(data);
            }
          },
          child: Container(
            height: SizeConfig.getScreenSize(context).height * 0.056,
            width: SizeConfig.getScreenSize(context).width * 0.85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black),
            child: Center(
              child: Text(
                "Proceed To Checkout",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        )
      ]),
    );
  }
  String stringToShare(){
    final CartController cartController = Get.put(CartController());
    final items=List.from(Appdata.cartList);
    String data="";
    data+="SNo ";
    data+="Name ";
    data+="Size ";
    data+="Quantity ";
    data+="Price \n";
    var count=1;
    items.forEach((element) {
      if(element.isselected){
        data+=count.toString();
        data+=" ";
        data+=element.name;
        data+=" ";
        data+=element.size.toString();
        data+=" ";
        data+=element.quantity.toString();
        data+=" ";
        data+=element.price.toString();
        data+="\n";
        count++;
      }
    });
    data+="total budget is except shipping charge       ";
    data+=cartController.total.toString();
    return data;
  }
  void openWhatsapp(String data) async {
    var whatsapp = "+919711828908";
    var whatsappURL = "https://wa.me/$whatsapp?text=${Uri.parse(data)}";
    if (await canLaunch(whatsappURL)) {
      await launch(whatsappURL);
    } else {
      throw "Could not launch whatsapp";
    }
  }
}

import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/models/review_cart_model.dart';
import 'package:foodtest0/provider/review_cart_provider.dart';
import 'package:foodtest0/widget/single_item.dart';
import 'package:provider/provider.dart';

class WishListProduct extends StatelessWidget {
//  const ReviewCart({Key? key}) : super(key: key);
  late ReviewCartProvider reviewCartProvider;
  showAlertDialog(BuildContext context,ReviewCartModel delete) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "No",
        style: TextStyle(
          color: primaryColor,
        ),
      ),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Yes",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      onPressed:  () {
        reviewCartProvider.reviewCartDataDelete(delete.cartID);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Are you want to delete?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Wishlist Product",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body:reviewCartProvider.getReviewCartDataList.isEmpty?Center(
        child: Text("No Data"),
      ):ListView.builder(
        itemCount: reviewCartProvider.getReviewCartDataList.length,
        itemBuilder: (context,index) {
          ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
          return Column(
            children: [
              SizedBox(height: 10,),
              SingleItem(
                isBool:true,
                productImage: data.cartImage,
                productName: data.cartName,
                productPrice: data.cartPrice,
                productId: data.cartID,
                productQuantity: data.cartQuantity,
                onDelete:(){
                  showAlertDialog(context,data);
                },
              ),
              // SizedBox(height: 10,),
            ],
          );
        } ,
      ),
    );
  }
}

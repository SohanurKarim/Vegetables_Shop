import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier{

  void addwishListData({
    required String wishListId,
    required String wishListName,
    required String wishListImage,
    required int wishListPrice,
    required int wishListQuantity,
    //required bool isAdd,
  }) async {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set(
        {
          "wishListId": wishListId,
          "wishListName": wishListName,
          "wishListImage": wishListImage,
          "wishListPrice": wishListPrice,
          "wishListQuantity": wishListQuantity,
          "wishList":true,
        }
    );
  }

}
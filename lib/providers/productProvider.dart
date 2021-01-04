import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant/models/productItem.dart';

class ProductProvider with ChangeNotifier {
  List<ProductItem> _items = [];
  CollectionReference db = FirebaseFirestore.instance.collection("product");

  List<ProductItem> getItems() {
    return [..._items];
  }

  void setProductItem() async {
    await db.get().then((QuerySnapshot querySnapshot) {
      List<ProductItem> myNewData = [];
      querySnapshot.docs.forEach((doc) {
        print(doc.id);
        myNewData.add(new ProductItem(
            productID: doc.id.toString(),
            name: doc["name"],
            resturent: doc["restorent"],
            details: doc["details"],
            price: doc["price"],
            offer: doc["offer"],
            image: doc["image"]));
      });
      this._items = myNewData;
      notifyListeners();
    }).catchError((e) => print(e.toString()));
    notifyListeners();
  }

  Future<void> addProduct() {
    CollectionReference productref =
        FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    return productref
        .add({
          "name": "test",
          "resturent": "test",
          "details": "test",
          "price": 10,
          "offer": 20,
          "image": "link"
        })
        .then((value) => notifyListeners())
        .catchError((error) => print("Failed to add user: $error"));
  }
}

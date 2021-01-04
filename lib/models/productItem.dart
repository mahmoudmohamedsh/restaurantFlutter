import 'package:flutter/foundation.dart';

class ProductItem{
  String productID;
  String name;
  String resturent;
  String details;
  int price;
  int offer;
  String image;

  ProductItem({
    @required this.productID,
    @required this.name, 
    @required this.resturent,
    @required this.details,
    @required this.price,
    @required this.offer,
    @required this.image,});
}
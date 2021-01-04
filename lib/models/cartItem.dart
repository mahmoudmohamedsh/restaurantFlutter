import 'package:flutter/cupertino.dart';

class CartItem{
  String name;
  String resturent;
  String details;
  double price;
  int offer;
  String image;
  int quantity;

  CartItem({
    @required this.name, 
    @required this.resturent,
    @required this.details,
    @required this.price,
    @required this.offer,
    @required this.image,
    @required this.quantity});
}
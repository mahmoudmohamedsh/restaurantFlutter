import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CartRef{
  DocumentReference productRef;
  int quantity;

  CartRef({@required this.productRef, @required this.quantity});
  
}
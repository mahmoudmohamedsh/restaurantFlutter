import 'package:flutter/material.dart';
import 'package:restaurant/models/productItem.dart';

class Item extends StatefulWidget {
  ProductItem product;
  Item({@required this.product});
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, 'itemDetails');
      },
          child: Container(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height/4,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage('images/download1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            title: Text(
              widget.product.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              widget.product.details,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              '${widget.product.price}\$',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(icon: Icon(Icons.add), onPressed: (){})
          )
        ]),
      ),
    );
  }
}

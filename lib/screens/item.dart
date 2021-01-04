import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String itemImage;
  Item(this.itemImage);
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
                image: AssetImage(widget.itemImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Burger',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'modern product',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              '500\$',
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

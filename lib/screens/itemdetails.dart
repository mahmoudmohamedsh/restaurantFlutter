import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  List itemImage = [
    'images/download1.jpg',
    'images/download2.jpg',
    'images/download3.jpg',
    'images/download4.jpg',
    'images/download1.jpg',
    'images/download2.jpg',
    'images/download3.jpg',
    'images/download4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                'Item Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 20.0,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: ListView.builder(
                itemCount: itemImage.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(itemImage[index]),
                      fit: BoxFit.fill,
                    )),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            ListTile(
            )
          ],
        ),
      ),
    );
  }
}

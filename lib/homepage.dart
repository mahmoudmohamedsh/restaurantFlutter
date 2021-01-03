import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> drawerItemTitle = ['Wishlist', 'Shopping Cart', 'Settings'];
  List<IconData> drawerItemIcon = [
    Icons.favorite,
    Icons.shopping_basket,
    Icons.settings
  ];
  List itemImage=[
  'images/download1.jpg',
  'images/download2.jpg',
  'images/download3.jpg',
  'images/download4.jpg',
  'images/download1.jpg',
  'images/download2.jpg',
  'images/download3.jpg',
  'images/download4.jpg'];
  bool rev;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25.0
          ),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        actions: [
          Icon(
            Icons.favorite_border,
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.add_shopping_cart,
          )
        ],
      ),
      drawer: Drawer(
          child: Container(
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: drawerItemTitle.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    drawerItemIcon[index],
                    color: Colors.black,
                    size: 20.0,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.black87,
                    size: 20.0,
                  ),
                  title: Text(
                    drawerItemTitle[index],
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                ),
              );
            }),
      )),
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 2, 5, 0),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/4,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/download5.jpg'),
                    alignment: Alignment.centerRight),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white10,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Offer 50%',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Harry up it\'s \nlimited time offer',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size:35.0
                  ),
                ],
              ),
            ),
            ListTile(
              leading:Text(
                    'all products',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    },
            ),
            Container(
              height: MediaQuery.of(context).size.height/7,
              margin: EdgeInsets.only(bottom: 10.0),
              child: item(false),
            ),
            ListTile(
              leading:Text(
                    'Most popular',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context,'products');
                  },
            ),
            Container(
              height: MediaQuery.of(context).size.height/5,
              margin: EdgeInsets.only(bottom: 10.0),
              child: item(true),

            )
          ],
        ),
        
      ),

    );
  }

  item(bool rev){
    return ListView.builder(scrollDirection: Axis.horizontal,
              itemCount:itemImage.length ,
              reverse: rev,
              itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width/3,
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(image: AssetImage(itemImage[index]),fit: BoxFit.fill),
                  ),
                );
              },
              );
  }
}

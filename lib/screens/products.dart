import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/models/productItem.dart';
import 'package:restaurant/providers/productProvider.dart';
import 'package:restaurant/screens/item.dart';

class Products extends StatefulWidget {
  
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool _init= true;
  List<ProductItem> items = [];
  @override
  void didChangeDependencies() async {
    if(_init){
      Provider.of<ProductProvider>(context,listen: false).setProductItem();
      _init = false;
    }
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    
   items =Provider.of<ProductProvider>(context).getItems();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Menu items',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
        bottom: PreferredSize(
            child: ListTile(
              leading: Text(
                '${items.length} Items',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(icon: Icon(Icons.filter_list), onPressed: (){}),
            ),
            preferredSize: Size(0.0, 40.0)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        actions: [
          IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Provider.of<ProductProvider>(context,listen: false).addProduct();
          },
        ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10.0
          ),
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          itemBuilder: (context,index){
            return Item(product:items[index]);
          },
        ),
      ),
    );
  }
}

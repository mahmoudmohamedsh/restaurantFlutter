import 'package:flutter/material.dart';


class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(left: 21, top: 10),
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 2 -22,
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: SafeArea(
                      child: Image.network(
                        "https://i.ytimg.com/vi/ALE3pE0jqr8/mqdefault.jpg",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "title",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "des",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "150\$%",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0),
                        ),
                        Text(
                          "40%",
                          style: TextStyle(
                              color: Theme.of(context).errorColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text("add"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                child:
                    IconButton(
                  color: Theme.of(context).errorColor,
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                right: 0,
              ),
              Positioned(
                child: Ribbon(),
                left: -20,
              )
            ],
          ),
        );
  }
}



class Ribbon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20.0, top: 0),
          child: ClipPath(
            clipper: ArcClipper(),
            child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * .04,
                padding: EdgeInsets.all(8.0),
                color: Colors.lightBlue,
                child: Center(
                    child: Text(
                  'PROMO',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ))),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              width: 20.0,
              height: 20.0,
              color: Colors.blue[700],
            ),
          ),
        )
      ],
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(15.0, 0.0);

    var firstControlPoint = Offset(7.5, 2.0);
    var firstPoint = Offset(5.0, 5.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(2.0, 7.5);
    var secondPoint = Offset(0.0, 15.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 20, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Appbar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar().build(),
        body: Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: ListView(
            children: [
              SingleItem("title", 65464).render(),
            ],
          ),
        ));
  }
}

class SingleItem {
  String title;
  double price;

  SingleItem(String title, double price) {
    this.title = title;
    this.price = price;
  }

  Card render() {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
              child: Image(
                image: NetworkImage(
                    'https://bites.com/images/shapes/food/pineapple.png'),
                width: 50,
                height: 50,
              ),
            ),
            Column(
              children: [
                Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "₹" + this.price.toString(),
                  style: TextStyle(
                      color: Colors.green,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

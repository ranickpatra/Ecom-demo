import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BuildContext buildContext;
  @override
  Widget build(BuildContext context) {
    this.buildContext = context;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar().build(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: ListView(
          children: [
            SingleCard(buildContext, "The title", "The subtitle", 10000).render(),
            SingleCard(buildContext, "The title", "The subtitle", 7000).render(),
            SingleCard(buildContext, "The title", "The subtitle", 50000).render(),
            SingleCard(buildContext, "The title", "The subtitle", 40000).render(),
          ],
        ),
      ),
    );
  }
}

class SingleCard {
  String title, subTitle;
  double price;
  BuildContext buildContext;

  SingleCard(BuildContext ctx, String title, String subTitle, double price) {
    this.buildContext = ctx;
    this.title = title;
    this.subTitle = subTitle;
    this.price = price;
  }

  Card render() {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(
              this.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              this.subTitle,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

          ),
          Image(
            image: NetworkImage(
                'https://thenationpress.net/en/imgs/2020/08/1597490497blobid0.jpg'),
          ),
          ListTile(
            title: Text(
              "₹ " + this.getPrice(),
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.green[800],
              ),
            ),
            trailing: FlatButton(
              onPressed: buyNow,
              child: Text("Buy Now"),
              color: Colors.orange[400],
            )
          ),
        ],
      ),
    );
  }

  String getPrice() {
    return this.price.toString();
  }

  void buyNow() {
    Navigator.of(this.buildContext).pushNamed('/cart');
  }



}

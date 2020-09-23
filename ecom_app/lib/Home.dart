import 'package:ecom_app/http_service.dart';
import 'package:ecom_app/product.dart';
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
        child: FutureBuilder(
          future: HttpService().getProducts(),
          builder: (context, snapshot) {
            List<Product> data = snapshot.data;
            return snapshot.hasData ? ListView.builder(
              itemCount: data.length,
                itemBuilder: (context, int index) {
                  return SingleCard(context, data[index].ProdDesc, data[index].ProdTag, data[index].PurRate.toDouble(), data[index].ImgUrl).render();
                }
            ) :
            Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class SingleCard {
  String title, subTitle;
  double price;
  BuildContext buildContext;
  String imageUrl;

  SingleCard(BuildContext ctx, String title, String subTitle, double price, String imageUrl) {
    this.buildContext = ctx;
    this.title = title;
    this.subTitle = subTitle;
    this.price = price;
    this.imageUrl = imageUrl;
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
            image: NetworkImage(this.imageUrl),
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
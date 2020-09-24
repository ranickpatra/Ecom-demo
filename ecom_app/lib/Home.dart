import 'package:ecom_app/cart.dart';
import 'package:ecom_app/http_service.dart';
import 'package:ecom_app/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Appbar.dart';

class Home extends StatefulWidget {
  int customerId;

  Home(this.customerId);

  @override
  _HomeState createState() => _HomeState(this.customerId);
}

class _HomeState extends State<Home> {
  BuildContext buildContext;
  int customerId;


  _HomeState(this.customerId);

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
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, int index) {
                      return SingleCard(context, this.customerId, data[index]).render();
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class SingleCard {
  Product product;
  String title, subTitle;
  int price;
  BuildContext buildContext;
  String imageUrl;
  int customerId;

  SingleCard(BuildContext ctx, int customerId, Product product) {
    this.buildContext = ctx;
    this.customerId = customerId;
    this.product = product;
    this.title = product.ProdDesc;
    this.subTitle = product.ProdTag;
    this.price = product.PurRate;
    this.imageUrl = product.ImgUrl;
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
              )),
        ],
      ),
    );
  }

  String getPrice() {
    return this.price.toString();
  }

  void buyNow() {
    // Navigator.of(this.buildContext).pushNamed('/cart');
    HttpService().addToCart(this.customerId, product).then((value) {
      dynamic toast = (String txt) => Fluttertoast.showToast(
          msg: txt,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.orange[300],
          textColor: Colors.white,
          fontSize: 16.6
      );

      if (value.status) {
        toast("Order added");
        Navigator.of(this.buildContext).push(MaterialPageRoute(
          builder: (context) => Cart(this.customerId),
        ));
      } else {
        toast("Order failed");
      }
    });
  }
}

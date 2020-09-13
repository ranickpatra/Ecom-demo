import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            // Here we create one to set status bar color
            backgroundColor: Colors.orange[
                400], // Set any color of status bar you want; or it defaults to your theme's primary color
          )),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: ListView(
          children: [
            SingleCard("The title", "The subtitle", 10000).item(),
            SingleCard("The title", "The subtitle", 7000).item(),
            SingleCard("The title", "The subtitle", 50000).item(),
            SingleCard("The title", "The subtitle", 40000).item(),
          ],
        ),
      ),
    );
  }
}

class SingleCard {
  String title, subTitle;
  double price;

  SingleCard(String title, String subTitle, double price) {
    this.title = title;
    this.subTitle = subTitle;
    this.price = price;
  }

  Card item() {
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
          )
        ],
      ),
    );
  }

  String getPrice() {
    return this.price.toString();
  }
}

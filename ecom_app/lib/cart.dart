import 'package:ecom_app/http_service.dart';
import 'package:ecom_app/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Appbar.dart';
import 'singleOrder.dart';

class Cart extends StatefulWidget {
  int customerId;

  Cart(this.customerId);

  @override
  _CartState createState() => _CartState(this.customerId);
}

class _CartState extends State<Cart> {
  int customerId;

  _CartState(this.customerId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar().build(),
        body: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: FutureBuilder(
                future: HttpService().getOrders(this.customerId),
                builder: (context, snapshot) {
                  List<SingleOrder> data = snapshot.data;
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return SingleItem(data[index]).render();
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                })));
  }
}

class SingleItem {
  SingleOrder singleOrder;

  SingleItem(SingleOrder singleOrder) {
    this.singleOrder = singleOrder;
  }

  Card render() {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      clipBehavior: Clip.antiAlias,
      child: FutureBuilder(
        future: HttpService().getProduct(singleOrder.prodCode),
        builder: (context, snapshot) {
          Product product = snapshot.data;
          return snapshot.hasData
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                        child: Image(
                          image: NetworkImage(
                              product.ImgUrl),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            product.ProdDesc,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "₹" + this.singleOrder.netAmt.toString(),
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 25, 5),
                          child: Column(
                            children: [
                              Text(
                                "Qty",
                                style: TextStyle(
                                    color: Colors.deepOrange[900],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                this.singleOrder.orderAmt.toString(),
                                style: TextStyle(
                                    color: Colors.teal[800],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

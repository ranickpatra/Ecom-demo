import 'dart:convert';
import 'package:ecom_app/loginStatus.dart';
import 'package:ecom_app/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'singleOrder.dart';

class HttpService {
  final String serverUrl = 'http://192.168.1.26:8000';
  final String _loginUrl = '/login';
  final String _productUrl = '/product';
  final String _productsUrl = '/products';
  final String _addToCartUrl = '/add-cart';
  final String _ordersUrl = '/orders';

  Future<LoginStatus> login(String email, String pass) async {
    String url =
        this.serverUrl + this._loginUrl + '?email=${email}&pass=${pass}';
    Response res = await get(url);
    if (res.statusCode == 200) {
      LoginStatus response = LoginStatus.fromJson(jsonDecode(res.body));
      return response;
    }

    return LoginStatus(status: false, id: -1);
  }

  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    Response res = await get(this.serverUrl + this._productsUrl);
    if (res.statusCode == 200) {
      for (var d in json.decode(res.body)) {
        products.add(Product.fromJson(d));
      }
    }
    return products;
  }

  Future<Product> getProduct(int prod_code) async {
    Response res = await get(this.serverUrl + this._productUrl + '?prod_code=${prod_code}');
    if (res.statusCode == 200) {
      return Product.fromJson(json.decode(res.body));
    }
    return null;
  }

  Future<StatusResponse> addToCart(int custCode, Product product) async {
    String url = this.serverUrl +
        this._addToCartUrl +
        '?cust_code=${custCode}&prod_code=${product.ProdCode}&order_amt=1&net_amt=${product.PurRate}';
    Response res = await get(url);
    if (res.statusCode == 200) {
      StatusResponse response = StatusResponse.fromJson(jsonDecode(res.body));
      return response;
    }
    return StatusResponse(status: false);
  }

  Future<List<SingleOrder>> getOrders(int custId) async {
    String url =
        this.serverUrl + this._ordersUrl + '?cust_code=${custId.toString()}';
    List<SingleOrder> orders = [];
    Response res = await get(url);
    if(res.statusCode == 200) {
      for(var d in json.decode(res.body)) {
        orders.add(SingleOrder.fromJson(d));
      }
    }

    return orders;
  }
}

class StatusResponse {
  bool status;

  StatusResponse({this.status});

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(status: json['stat'] as bool);
  }
}

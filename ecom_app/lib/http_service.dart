import 'dart:convert';
import 'package:ecom_app/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class HttpService {
  final String _loginUrl = 'http://192.168.1.26:8000/login';
  final String _productsUrl = 'http://192.168.1.26:8000/products';
  

  Future<StatusResponse> login(String email, String pass) async {
    String url = _loginUrl + '?email=${email}&pass=${pass}';
    Response res = await get(url);
    if (res.statusCode == 200) {
      StatusResponse response = StatusResponse.fromJson(jsonDecode(res.body));
      return response;
    }

    return StatusResponse(status: false);
  }


  Future<List<Product>> getProducts() async {
    Response res = await get(this._productsUrl);
    if(res.statusCode == 200) {
      List<Product> products = [];
      for(var d in json.decode(res.body)){
        products.add(Product.fromJson(d));
      }
      return products;
    }
    List <Product> products = [];
    return products;
  }
  



}

class StatusResponse {
  bool status;

  StatusResponse({this.status});

  factory StatusResponse.fromJson(Map<String, dynamic> json) {
    return StatusResponse(status: json['stat'] as bool);
  }
}

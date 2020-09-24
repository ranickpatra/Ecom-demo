
import 'package:flutter/cupertino.dart';

class Product {
  int ProdCode;
  String ProdTag;
  String ProdDesc;
  int PurRate;
  int SalesRate;
  int MaxDisc;
  String ProdCatg;
  String UnitCode;
  String ProdStat;
  String ImgUrl;

  Product(
      {@required this.ProdCode,
        @required this.ProdTag,
        @required this.ProdDesc,
        @required this.PurRate,
        @required this.SalesRate,
        @required this.MaxDisc,
        @required this.ProdCatg,
        @required this.UnitCode,
        @required this.ProdStat,
        @required this.ImgUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      ProdCode: json['ProdCode'] as int,
      ProdTag: json['ProdTag'] as String,
      ProdDesc: json['ProdDesc'] as String,
      PurRate: json['PurRate'] as int,
      SalesRate: json['SalesRate'] as int,
      MaxDisc: json['MaxDisc'] as int,
      ProdCatg: json['ProdCatg'] as String,
      UnitCode: json['UnitCode'] as String,
      ProdStat: json['ProdStat'] as String,
      ImgUrl: json['ImgUrl'] as String,
    );
  }
}


class SingleOrder {
  String custCode;
  int prodCode;
  int orderAmt;
  int netAmt;

  SingleOrder({this.custCode, this.prodCode, this.orderAmt, this.netAmt});


  factory SingleOrder.fromJson(Map<String, dynamic> json) {
    return SingleOrder(
      custCode: json['CustCode'] as String,
      prodCode: json['ProdCode'] as int,
      orderAmt: json['OrderAmt'] as int,
      netAmt: json['NetAmt'] as int
    );
  }
}
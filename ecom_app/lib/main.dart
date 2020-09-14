import 'package:ecom_app/Login.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main() => runApp(MaterialApp(
  routes: <String, WidgetBuilder> {
    '/home': (BuildContext context) => new Home()
},
  home: Login(),
));


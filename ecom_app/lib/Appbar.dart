import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appbar {
  Widget build() {
    return PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          // Here we create one to set status bar color
          backgroundColor: Colors.orange[
              400], // Set any color of status bar you want; or it defaults to your theme's primary color
        ));
  }
}

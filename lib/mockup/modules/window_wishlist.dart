import 'package:flutter/material.dart';

class WishListWindow extends StatefulWidget {
  _WishListWindowState createState() => _WishListWindowState();
}

class _WishListWindowState extends State<WishListWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Material(child: Container(child: Text("Wish List"),),),
    );
  }
}
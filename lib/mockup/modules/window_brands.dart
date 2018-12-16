import 'package:flutter/material.dart';

class BrandsWindow extends StatefulWidget {
  _BrandsWindowState createState() => _BrandsWindowState();
}

class _BrandsWindowState extends State<BrandsWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Material(child: Container(child: Text("Brands"),),),
    );
  }
}
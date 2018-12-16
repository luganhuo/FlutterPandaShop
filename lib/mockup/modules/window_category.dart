import 'package:flutter/material.dart';

class CategoryWindow extends StatefulWidget {
  _CategoryWindowState createState() => _CategoryWindowState();
}

class _CategoryWindowState extends State<CategoryWindow> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Material(child: Container(child: Text("Category"),),),
    );
  }
}

import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HomeWidget'),
      ),
    );
  }
}
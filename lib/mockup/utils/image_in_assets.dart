import 'package:flutter/material.dart';

class ImageInAssets {
  final AssetImage _assetImage;

  AssetImage assetImage() => _assetImage;
  Image image({Color color}) => Image(
        image: _assetImage,
        color: color,
      );

  ImageInAssets({String name}) : _assetImage = AssetImage(name);
}

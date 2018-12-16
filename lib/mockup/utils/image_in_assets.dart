import 'package:flutter/cupertino.dart';

class ImageInAssets {
  final AssetImage _assetImage;

  AssetImage assetImage() => _assetImage;
  Image image() => Image(image: _assetImage);

  ImageInAssets({String name}) : _assetImage = AssetImage(name);
}
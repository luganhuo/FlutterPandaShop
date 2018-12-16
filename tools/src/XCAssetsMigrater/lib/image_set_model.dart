import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'image_set_model.g.dart';

@JsonSerializable(nullable:false)
class ImageSetModel {
  final String idiom;
  final String filename;
  final String scale;

  ImageSetModel({this.idiom, this.filename, this.scale});

  factory ImageSetModel.fromJson(Map<String, dynamic> json) => _$ImageSetModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSetModelToJson(this);
}




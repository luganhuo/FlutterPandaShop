import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

import 'image_set_info_model.dart';
import 'image_set_model.dart';

part 'image_set_content_model.g.dart';

@JsonSerializable(nullable:false)
class ImageSetContentModel {
  final List<ImageSetModel> images;
  final ImageSetInfoModel info;

  ImageSetContentModel({this.images, this.info});

  factory ImageSetContentModel.fromJson(Map<String, dynamic> json) => _$ImageSetContentModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSetContentModelToJson(this);
}
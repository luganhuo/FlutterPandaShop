import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'image_set_info_model.g.dart';

@JsonSerializable(nullable:false)
class ImageSetInfoModel {
  int version;
  String author;

  ImageSetInfoModel({this.version, this.author});

  factory ImageSetInfoModel.fromJson(Map<String, dynamic> json) => _$ImageSetInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSetInfoModelToJson(this);
}

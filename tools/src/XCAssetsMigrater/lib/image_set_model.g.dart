// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSetModel _$ImageSetModelFromJson(Map<String, dynamic> json) {
  return ImageSetModel(
      idiom: json['idiom'] as String,
      filename: json['filename'] as String,
      scale: json['scale'] as String);
}

Map<String, dynamic> _$ImageSetModelToJson(ImageSetModel instance) =>
    <String, dynamic>{
      'idiom': instance.idiom,
      'filename': instance.filename,
      'scale': instance.scale
    };

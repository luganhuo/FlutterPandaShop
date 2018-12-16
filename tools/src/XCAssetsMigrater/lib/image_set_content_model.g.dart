// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_set_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSetContentModel _$ImageSetContentModelFromJson(Map<String, dynamic> json) {
  return ImageSetContentModel(
      images: (json['images'] as List)
          .map((e) => ImageSetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: ImageSetInfoModel.fromJson(json['info'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ImageSetContentModelToJson(
        ImageSetContentModel instance) =>
    <String, dynamic>{'images': instance.images, 'info': instance.info};

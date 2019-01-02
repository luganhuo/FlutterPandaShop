// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MerchantsFilterRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantsFilterRequestModel _$MerchantsFilterRequestModelFromJson(
    Map<String, dynamic> json) {
  return MerchantsFilterRequestModel(
      _$enumDecode(_$GenderTypeEnumMap, json['gender']),
      json['cityId'] as int,
      json['countryId'] as int,
      json['visible'] as int,
      (json['merchantIds'] as List).map((e) => e as int).toList());
}

Map<String, dynamic> _$MerchantsFilterRequestModelToJson(
        MerchantsFilterRequestModel instance) =>
    <String, dynamic>{
      'gender': _$GenderTypeEnumMap[instance.gender],
      'cityId': instance.cityId,
      'countryId': instance.countryId,
      'visible': instance.visible,
      'merchantIds': instance.merchantIds
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$GenderTypeEnumMap = <GenderType, dynamic>{
  GenderType.Woman: 'Woman',
  GenderType.Man: 'Man',
  GenderType.Unisex: 'Unisex',
  GenderType.Kid: 'Kid'
};

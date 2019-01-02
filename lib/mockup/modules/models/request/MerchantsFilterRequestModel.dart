import 'package:json_annotation/json_annotation.dart';

import '../ModelEnums.dart';

part 'MerchantsFilterRequestModel.g.dart';

@JsonSerializable(nullable: false)
class MerchantsFilterRequestModel extends Object {
  final GenderType gender;
  final int cityId;
  final int countryId;
  final int visible;
  final List<int> merchantIds;

  MerchantsFilterRequestModel(this.gender, this.cityId, this.countryId, this.visible, this.merchantIds);
  factory MerchantsFilterRequestModel.fromJson(Map<String, dynamic> json) => _$MerchantsFilterRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantsFilterRequestModelToJson(this);
}

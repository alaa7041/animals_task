import 'package:json_annotation/json_annotation.dart';

part 'breeds_model.g.dart';

@JsonSerializable()
class BreedModel {
  final String id;
  final String name;
  final String? origin;
  final String? temperament;
  final String? description;

  BreedModel({
    required this.id,
    required this.name,
    this.origin,
    this.temperament,
    this.description,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) => _$BreedModelFromJson(json);
  Map<String, dynamic> toJson() => _$BreedModelToJson(this);
}

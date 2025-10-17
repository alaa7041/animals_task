// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => BreedModel(
      id: json['id'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String?,
      temperament: json['temperament'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BreedModelToJson(BreedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'origin': instance.origin,
      'temperament': instance.temperament,
      'description': instance.description,
    };

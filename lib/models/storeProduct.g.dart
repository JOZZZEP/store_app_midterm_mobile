// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreProduct _$StoreProductFromJson(Map<String, dynamic> json) => StoreProduct()
  ..storeProduct = (json['storeProduct'] as List<dynamic>)
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$StoreProductToJson(StoreProduct instance) =>
    <String, dynamic>{
      'storeProduct': instance.storeProduct,
    };

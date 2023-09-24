// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProduct _$CartProductFromJson(Map<String, dynamic> json) => CartProduct()
  ..productId = json['productId'] as num
  ..quantity = json['quantity'] as num;

Map<String, dynamic> _$CartProductToJson(CartProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };

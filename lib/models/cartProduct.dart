import 'package:json_annotation/json_annotation.dart';

part 'cartProduct.g.dart';

@JsonSerializable()
class CartProduct {
  CartProduct();

  late num productId;
  late num quantity;
  
  factory CartProduct.fromJson(Map<String,dynamic> json) => _$CartProductFromJson(json);
  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}

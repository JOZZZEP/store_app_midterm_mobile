import 'package:json_annotation/json_annotation.dart';
import "cartProduct.dart";
part 'cart.g.dart';

@JsonSerializable()
class Cart {
  Cart();

  late num id;
  late num userId;
  late String date;
  late List<CartProduct> products;
  
  factory Cart.fromJson(Map<String,dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import "cart.dart";
part 'carts.g.dart';

@JsonSerializable()
class Carts {
  Carts();

  late List<Cart> carts;
  
  factory Carts.fromJson(Map<String,dynamic> json) => _$CartsFromJson(json);
  Map<String, dynamic> toJson() => _$CartsToJson(this);
}

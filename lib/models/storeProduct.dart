import 'package:json_annotation/json_annotation.dart';
import "product.dart";
part 'storeProduct.g.dart';

@JsonSerializable()
class StoreProduct {
  StoreProduct();

  late List<Product> storeProduct;
  
  factory StoreProduct.fromJson(Map<String,dynamic> json) => _$StoreProductFromJson(json);
  Map<String, dynamic> toJson() => _$StoreProductToJson(this);
}

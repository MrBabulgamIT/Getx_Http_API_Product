// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.image_link,
      this.description,
      this.product_type});

  int? id;
  String? brand;
  String? name;
  String? price;
  String? image_link;
  String? description;
  String? product_type;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        image_link: json["image_link"],
        description: json["description"],
        product_type: json["product_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "image_link": brand,
        "description": name,
        "product_type": price,
      };
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/domain/product/entity/product.dart';
import 'color.dart';

// class ProductModel {
//   final String categoryId;
//   final List < ProductColorModel > colors;
//   final Timestamp createdDate;
//   final num discountedPrice;
//   final int gender;
//   final List < String > images;
//   final num price;
//   final List < String > sizes;
//   final String productId;
//   final int salesNumber;
//   final String title;

//   ProductModel({
//     required this.categoryId,
//     required this.colors,
//     required this.createdDate,
//     required this.discountedPrice,
//     required this.gender,
//     required this.images,
//     required this.price,
//     required this.sizes,
//     required this.productId,
//     required this.salesNumber,
//     required this.title
//   });

 
//   factory ProductModel.fromMap(Map<String, dynamic> map) {
//     return ProductModel(
//       categoryId: map['categoryId'] as String,
//       colors: List<ProductColorModel>.from(
//         map['colors'].map((e)=> ProductColorModel.fromMap(e))
//       ),
//       createdDate: map['createdDate'] as Timestamp,
//       discountedPrice: map['discountedPrice'] as num,
//       gender: map['gender'] as int,
//       images: List < String >.from(
//         map['images'].map((e) => e.toString()),
//       ),
//       price: map['price'] as num,
//       sizes: List < String >.from(
//         map['sizes'].map((e) => e.toString()),
//       ),
//       productId: map['productId'] as String,
//       salesNumber: map['salesNumber'] as int,
//       title: map['title'] as String,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'categoryId': categoryId,
//       'colors': colors.map((e) => e.toMap()).toList(),
//       'createdDate': createdDate,
//       'discountedPrice': discountedPrice,
//       'gender': gender,
//       'images': images.map((e) => e.toString()).toList(),
//       'price': price,
//       'sizes': sizes.map((e) => e.toString()).toList(),
//       'productId': productId,
//       'salesNumber': salesNumber,
//       'title': title,
//     };
//   }

// }

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    // Safely handle potential null values and cast to the correct type
    List<dynamic>? colorList = map['colors'] as List<dynamic>?; 
    List<ProductColorModel> colors = colorList?.map((e) => ProductColorModel.fromMap(e as Map<String, dynamic>)).toList() ?? [];
    
    List<dynamic>? imageList = map['images'] as List<dynamic>?;
    List<String> images = List<String>.from(imageList?.map((e) => e.toString()) ?? []);
    
    List<dynamic>? sizeList = map['sizes'] as List<dynamic>?;
    List<String> sizes = List<String>.from(sizeList?.map((e) => e.toString()) ?? []);

    return ProductModel(
      categoryId: map['categoryId'] as String? ?? '',
      colors: colors,
      createdDate: map['createdDate'] as Timestamp? ?? Timestamp.now(), // Adjust according to your logic
      discountedPrice: map['discountedPrice'] as num? ?? 0,
      gender: map['gender'] as int? ?? 0,
      images: images,
      price: map['price'] as num? ?? 0,
      sizes: sizes,
      productId: map['productId'] as String? ?? '',
      salesNumber: map['salesNumber'] as int? ?? 0,
      title: map['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images,
      'price': price,
      'sizes': sizes,
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
    };
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images, 
      price: price,
      sizes: sizes, 
      productId: productId, 
      salesNumber: salesNumber, 
      title: title
    );
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      colors: colors.map((e) => e.fromEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images, 
      price: price,
      sizes: sizes, 
      productId: productId, 
      salesNumber: salesNumber, 
      title: title
    );
  }
}
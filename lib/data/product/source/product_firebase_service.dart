import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();Future<Either> getProductsByCategoryId(String categoryId);
}

class ProductFirebaseServiceImpl extends ProductFirebaseService{ 
  @override
  Future<Either> getTopSelling() async{
    try{
      
      var returnedData = await FirebaseFirestore.instance.collection("Products").get();//.where("salesNumber",isGreaterThanOrEqualTo: 20).get();
return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch(e) {
return const Left("Error fetching top selling products");
    }
  }
  
  @override
  Future<Either> getNewIn() async{
    try{
      
      var returnedData = await FirebaseFirestore.instance.collection("Products").get();//.where("createdDate ",isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(2024,7,25))).get();
return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch(e) {
return const Left("Error fetching new in products");
    }
  }
  
  @override
  Future<Either> getProductsByCategoryId(String categoryId) async{
    log("catId: $categoryId");
    var returnedData = await FirebaseFirestore.instance.collection("Products").where("categoryId",isEqualTo: categoryId).get();
return Right(returnedData.docs.map((e) => e.data()).toList());
  }

}
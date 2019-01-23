import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import '../model/productCategory.dart';
import '../services/ProductCategoryStorage.dart';


fetchMasterData(http.Client client) async {
  final response =
  await client.get('http://yoodevov3.azurewebsites.net/api/MasterData?clienttypeid=8',
    headers: {'If-Modified-Since': '1900-01-01'});

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    List<ProductCategory> productCategories=await compute(parseMasterData, response.body);
    ProductCategoryStorage pcStorage=new ProductCategoryStorage();
    await pcStorage.writeCategories(productCategories);
    
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
  // Use the compute function to run parsePhotos in a separate isolate

}

// A function that will convert a response body into a List<Photo>
List<ProductCategory> parseMasterData(String responseBody) {
  log(responseBody);

  Map<String, dynamic> parsed = json.decode(responseBody);

  var list = parsed['categories'] as List;
  print(list.runtimeType); //returns List<dynamic>

  List<ProductCategory> productCategories = list.map((i) => ProductCategory.fromJson(i)).toList();

  print(productCategories);
  return productCategories;
}




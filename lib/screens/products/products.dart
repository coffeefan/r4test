import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../services/masterdata.dart';
import '../../model/productCategory.dart';
import '../../services/ProductCategoryStorage.dart';
import 'dart:developer';

Future<List<ProductCategory>> fetchPhotos(http.Client client) async {
  log("Naaatooor");
  fetchMasterData(client);

  ProductCategoryStorage pcStorage=new ProductCategoryStorage();
  List<ProductCategory> productCategories= await pcStorage.readCategories();

  return productCategories;
}

// A function that will convert a response body into a List<Photo>
List<Photo> parsePhotos(String responseBody) {

  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}



class ProductScreen extends StatelessWidget {
  final String title;

  ProductScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<ProductCategory>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(productCategories: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<ProductCategory> productCategories;

  PhotosList({Key key, this.productCategories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: productCategories.length,
      itemBuilder: (context, index) {
        return Image.network('https://yooimage.azurewebsites.net/dev-media/'+productCategories[index].imageRectangular+'?quality=90&format=jpg&mode=crop&width=960&height=360');
      },
    );
  }
}

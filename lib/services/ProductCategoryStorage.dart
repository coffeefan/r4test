import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../model/productCategory.dart';
import 'dart:convert';

class ProductCategoryStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/productcategories.json');
  }

  Future<List<ProductCategory>> readCategories() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      List<ProductCategory> productCategories =(json.decode(contents) as List).map((i) => new ProductCategory.fromJson(i)).toList();

      return productCategories;
    } catch (e) {
      // If we encounter an error, return 0
      return null;
    }
  }

  Future<File> writeCategories(List<ProductCategory> categories) async {
    final file = await _localFile;

    final String export=jsonEncode(categories);
    // Write the file
    return file.writeAsString(export);
  }
}
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';

import 'package:store_app/src/models/brand.dart';
import 'package:store_app/src/models/category.dart';
import 'package:store_app/src/models/product.dart';

class HomeViewModel extends BaseModel {
  ApiService _apiService = ApiService();

  List<Category> categories = [];
  List<Brand> brands = [];
  List<Product> flashSaleProducts = [];
  CategoriesList categoriesList = CategoriesList();
  BrandsList brandsList = BrandsList();
  List<Product> productsOfCategoryList;
  List<Product> productsOfBrandsList;

  void fetchInitData() async {
    if (brands.isEmpty && categories.isEmpty) {
      fetchBrands().whenComplete(() {
        setState();
      });

      fetchCategories().whenComplete(() {
        setState();
      });
    }

    // else {
    //   final categoryResponse = await _apiService.getCategories();
    //   final data = categoryResponse.data.toString();
    //   final path = await getTemporaryDirectory();
    //   final outputFile =
    //       await File('${path.path}/category.txt').create(recursive: true);
    //   List<int> bytes = utf8.encode(data);
    //   DefaultCacheManager().putFile(outputFile.path, bytes);
    //   final file = await DefaultCacheManager().getSingleFile(outputFile.path);
    //   print(utf8.decode(await file.readAsBytes()));
    // }
  }

  Future<List<Category>> fetchCategories() async {
    if (categories.isEmpty) {
      final categoryResponse = await _apiService.fetchCategories();
      categories = [];
      if (!categoryResponse.error) {
        for (var x in categoryResponse.data) {
          Category category = Category.fromJson(x);
          categories.add(category);
        }
        productsOfCategoryList = categories.first.products;
        categoriesList.list = categories;
      } else {
        print('error in line 44: ' + categoryResponse.errorMessage);
      }
    }
    return categories;
  }

  Future<List<Brand>> fetchBrands() async {
    if (brands.isEmpty) {
      final brandResponse = await _apiService.fetchBrands();
      brands = [];
      if (!brandResponse.error) {
        for (var x in brandResponse.data) {
          Brand brand = Brand.fromJson(x);
          brands.add(brand);
        }
        productsOfBrandsList = brands.first.products;
        brandsList.list = brands;
      } else {
        print('error in line 60: ' + brandResponse.errorMessage);
      }
    }
    return brands;
  }

  void fetchFlashSaleProducts() async {
    final response = await _apiService.getFlashSaleProducts();
    print(response.data);
  }
}

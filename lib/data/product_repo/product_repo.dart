import 'dart:convert';

import 'package:MyFeveretClone/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRepo {
  Future<List<ProductModel>> getProducts();
}

List<ProductModel> getList(List<dynamic> raw) {
  return raw.map((e) => new ProductModel.fromJson(e)).toList();
}

class ProductRepoImpl extends ProductRepo {
  @override
  Future<List<ProductModel>> getProducts() async {
    var response = await http.get(
        'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=stories');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ProductModel> trendingProducts = getList(body[0]);
      return trendingProducts;
    } else {
      throw Exception('Failed');
    }
  }
}

import 'dart:convert';

import 'package:MyFeveretClone/models/trending_products.dart';
import 'package:http/http.dart' as http;

abstract class TrendingProductRepo {
  Future<List<TrendingProductsModel>> getProducts();
}

List<TrendingProductsModel> getList(List<dynamic> raw) {
  return raw.map((e) => new TrendingProductsModel.fromJson(e)).toList();
}

class TrendingProductRepoImpl extends TrendingProductRepo {
  @override
  Future<List<TrendingProductsModel>> getProducts() async {
    var response = await http.get(
        'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=trendingProducts&fbclid=IwAR3YoRr-xyiZ0jCyzpsqYH9aFUPLxE-UyZt_4jjWMIKmrLsNyLwy3Hz4BEA');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<TrendingProductsModel> trendingProducts = getList(body[0]);
      return trendingProducts;
    } else {
      throw Exception('Failed');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:MyFeveretClone/models/trending_sellers_model.dart';

abstract class TrendingSellerRepo {
  Future<List<TrendingSellersModel>> getSellers();
}

List<TrendingSellersModel> getList(List<dynamic> raw) {
  return raw.map((e) => new TrendingSellersModel.fromJson(e)).toList();
}

class TrendingRepoImpl extends TrendingSellerRepo {
  @override
  Future<List<TrendingSellersModel>> getSellers() async {
    var response = await http.get(
        'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=trending_seller&fbclid=IwAR1I3TKLyphTfXFnmJBqQL62E5MwgPMQDW4K3zC_aZBJuPDi39SqS5fyd3k');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<TrendingSellersModel> sellers = getList(body[0]);
      // var data = json.decode(response.body);
      // List<TrendignSellersModel> sellers = trendignSellersModelFromJson(data);
      return sellers;
    } else {
      throw Exception('Failed');
    }
  }
}

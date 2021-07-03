import 'dart:convert';

import 'package:MyFeveretClone/models/new_arival_model.dart';
import 'package:http/http.dart' as http;

abstract class ArivalRepo {
  Future<List<NewArivalModel>> getArivals();
}

List<NewArivalModel> getList(List<dynamic> raw) {
  return raw.map((e) => new NewArivalModel.fromJson(e)).toList();
}

class ArivalRepoImpl extends ArivalRepo {
  @override
  Future<List<NewArivalModel>> getArivals() async {
    var response = await http.get(
        'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=newArrivals');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<NewArivalModel> trendingProducts = getList(body[0]);
      return trendingProducts;
    } else {
      throw Exception('Failed');
    }
  }
}

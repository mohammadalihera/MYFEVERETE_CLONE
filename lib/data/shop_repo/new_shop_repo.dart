import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:MyFeveretClone/models/new_shop_model.dart';

abstract class NewShopRepo {
  Future<List<NewShopModel>> getShops();
}

List<NewShopModel> getList(List<dynamic> raw) {
  return raw.map((e) => new NewShopModel.fromJson(e)).toList();
}

class NewShopRepoImpl extends NewShopRepo {
  @override
  Future<List<NewShopModel>> getShops() async {
    var response = await http.get(
        'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=newShops');
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<NewShopModel> sellers = getList(body[0]);
      return sellers;
    } else {
      throw Exception('Failed');
    }
  }
}

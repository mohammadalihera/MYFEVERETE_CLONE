// import 'dart:convert';
// import 'package:MyFeveretClone/models/trending_sellers_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// List<TrendignSellersModel> categories;

// class TrendingSellerList extends StatefulWidget {
//   @override
//   _TrendingSellerListState createState() => _TrendingSellerListState();
// }

// class _TrendingSellerListState extends State<TrendingSellerList> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getCategoryList(),
//       builder: (context, AsyncSnapshot snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//           case ConnectionState.waiting:
//             return Text('Loading');
//           default:
//             if (snapshot.hasError)
//               return Text('Error: ${snapshot.error}');
//             else
//               return createListView(context, snapshot);
//         }
//       },
//     );
//   }
// }

// Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
//   List<TrendignSellersModel> values = snapshot.data;
//   return Container(
//     height: 140,
//     padding: EdgeInsets.only(right: 5),
//     child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: values.length,
//         itemBuilder: (context, i) {
//           return Container(
//             margin: EdgeInsets.only(right: 10),
//             width: 100,
//             color: Colors.white54,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   child: Image.network(values[i].sellerItemPhoto),
//                 ),
//                 Container(
//                   child: Text(
//                     values[i].sellerName,
//                     style: TextStyle(fontSize: 12),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }),
//   );
// }

// Future<List<TrendignSellersModel>> getCategoryList() async {
//   if (categories == null) {
//     Response response;
//     response = await get(
//         'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=trending_seller&fbclid=IwAR1I3TKLyphTfXFnmJBqQL62E5MwgPMQDW4K3zC_aZBJuPDi39SqS5fyd3k');
//     int statusCode = response.statusCode;
//     final body = json.decode(response.body);
//     if (statusCode == 200) {
//       categories =
//           (body as List).map((i) => TrendignSellersModel.fromJson(i)).toList();

//       return categories;
//     } else {
//       return categories = List();
//     }
//   } else {
//     return categories;
//   }
// }

// // https://api.evaly.com.bd/core/public/categories/?parent=bags-luggage-966bc8aac     sub cate by slug

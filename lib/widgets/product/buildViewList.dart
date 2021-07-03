import 'package:MyFeveretClone/models/product_model.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildViewList(List<ProductModel> products, int number) {
  List<ProductModel> showProduct = new List<ProductModel>();
  if (number == 3) {
    for (int i = 0; i < number; i++) {
      showProduct.add(products[i]);
    }
  } else if (number == 6) {
    for (int i = 3; i < number; i++) {
      showProduct.add(products[i]);
    }
  } else {
    for (int i = 6; i < products.length; i++) {
      showProduct.add(products[i]);
    }
  }
  return Container(
    height: number > 6
        ? products.length * 305.0 + 200
        : number > 2
            ? 3 * 400.0
            : 3 * 400.0,
    child: new ListView.builder(
        itemCount: showProduct.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 5, right: 10, top: 10),
                        height: 50,
                        width: 50,
                        decoration: showProduct[i].companyLogo != null
                            ? BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      showProduct[i].companyLogo,
                                    ),
                                    fit: BoxFit.cover),
                              )
                            : BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                        child: showProduct[i].companyLogo != null
                            ? SizedBox(
                                height: 0,
                              )
                            : Center(
                                child: Text(
                                  showProduct[i].shopName[0],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              showProduct[i].shopName,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              showProduct[i].storyTime.toIso8601String(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    products[i].story.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  child: Image.network(showProduct[i].storyImage),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.shopify,
                              size: 16,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  'MYR 9.00',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.list,
                              size: 16,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  showProduct[i].availableStock.toString() +
                                      ' ' +
                                      'Available Stock',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.shoppingCart,
                              size: 16,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  showProduct[i].orderQty.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
  );
}

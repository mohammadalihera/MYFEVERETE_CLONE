import 'package:flutter/material.dart';
import 'package:MyFeveretClone/models/trending_sellers_model.dart';
import 'dart:ui';

Widget buildHintList(List<TrendingSellersModel> seller) {
  return new ListView.builder(
      itemCount: seller.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[100].withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            image: DecorationImage(
                image: NetworkImage(
                  seller[i].sellerItemPhoto,
                ),
                fit: BoxFit.cover),
          ),
          margin: EdgeInsets.only(left: 5, right: 5),
          width: 120,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  width: 120,
                  height: 40,
                  child: Center(
                    child: Text(
                      seller[i].ezShopName,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

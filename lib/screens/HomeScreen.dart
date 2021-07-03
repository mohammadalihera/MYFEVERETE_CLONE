import 'package:flutter/material.dart';
import 'package:MyFeveretClone/widgets/trending_sellers.dart';
import 'package:MyFeveretClone/widgets/trending_products.dart';
import 'package:MyFeveretClone/widgets/product/product_view.dart';
import 'package:MyFeveretClone/widgets/arival/new_arival_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MyFeveretClone/bloc/seller_bloc/seller_bloc.dart';
import 'package:MyFeveretClone/bloc/trending_product_bloc/trending_product_bloc.dart';
import 'package:MyFeveretClone/bloc/arival_bloc/arival_bloc.dart';
import 'package:MyFeveretClone/bloc/product_bloc/product_bloc.dart';
import 'package:MyFeveretClone/data/trending_seller/trending_seller_repo.dart';
import 'package:MyFeveretClone/data/arival_repo/arival_repo.dart';
import 'package:MyFeveretClone/data/trending_products_repo/trending_product_repo.dart';
import 'package:MyFeveretClone/data/product_repo/product_repo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            BlocProvider(
              create: (context) => SellerBloc(sellerRepo: TrendingRepoImpl()),
              child: TrendingSellers(),
            ),
            BlocProvider(
              create: (context) =>
                  TrendignProductBloc(productRepo: TrendingProductRepoImpl()),
              child: TrendingProducts(),
            ),
            BlocProvider(
              create: (context) => ProductBloc(productRepo: ProductRepoImpl()),
              child: ProductView(
                pNum: 3,
              ),
            ),
            BlocProvider(
              create: (context) => ArivalBloc(arivalRepo: ArivalRepoImpl()),
              child: NewArival(),
            ),
            BlocProvider(
              create: (context) => ProductBloc(productRepo: ProductRepoImpl()),
              child: ProductView(
                pNum: 6,
              ),
            ),
            BlocProvider(
              create: (context) =>
                  TrendignProductBloc(productRepo: TrendingProductRepoImpl()),
              child: TrendingProducts(),
            ),
            BlocProvider(
              create: (context) => ProductBloc(productRepo: ProductRepoImpl()),
              child: ProductView(
                pNum: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DiscountBanner("A Summer Surpise\n", "Cashback 20%")

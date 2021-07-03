import 'package:MyFeveretClone/models/trending_products.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TrendingProductState extends Equatable {}

class TrendingProductInitialState extends TrendingProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends TrendingProductState {
  @override
  List<Object> get props => [];
}

class TrendingProductLoadedState extends TrendingProductState {
  List<TrendingProductsModel> trendingProducts;
  TrendingProductLoadedState({@required this.trendingProducts});
  @override
  List<Object> get props => null;
}

class TrendingProductErrorState extends TrendingProductState {
  String message;
  TrendingProductErrorState({@required this.message});
  @override
  List<Object> get props => null;
}

import 'package:MyFeveretClone/models/trending_sellers_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SellerState extends Equatable {}

class SellerInitialState extends SellerState {
  @override
  List<Object> get props => [];
}

class SellerLoadingState extends SellerState {
  @override
  List<Object> get props => [];
}

class SellerLoadedState extends SellerState {
  List<TrendingSellersModel> sellers;
  SellerLoadedState({@required this.sellers});
  @override
  List<Object> get props => null;
}

class SellerErrorState extends SellerState {
  String message;
  SellerErrorState({@required this.message});
  @override
  List<Object> get props => null;
}

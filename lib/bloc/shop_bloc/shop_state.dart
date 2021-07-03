import 'package:MyFeveretClone/models/new_shop_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ShopState extends Equatable {}

class ShopInitialState extends ShopState {
  @override
  List<Object> get props => [];
}

class ShopLoadingState extends ShopState {
  @override
  List<Object> get props => [];
}

class ShopLoadedState extends ShopState {
  List<NewShopModel> shops;
  ShopLoadedState({@required this.shops});
  @override
  List<Object> get props => null;
}

class ShopErrorState extends ShopState {
  String message;
  ShopErrorState({@required this.message});
  @override
  List<Object> get props => null;
}

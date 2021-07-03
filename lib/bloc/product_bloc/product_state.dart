import 'package:MyFeveretClone/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState {
  List<ProductModel> products;
  ProductLoadedState({@required this.products});
  @override
  List<Object> get props => null;
}

class ProductErrorState extends ProductState {
  String message;
  ProductErrorState({@required this.message});
  @override
  List<Object> get props => null;
}

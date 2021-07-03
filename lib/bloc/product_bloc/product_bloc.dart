import 'package:MyFeveretClone/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MyFeveretClone/bloc/product_bloc/product_event.dart';
import 'package:MyFeveretClone/bloc/product_bloc/product_state.dart';
import 'package:MyFeveretClone/data/product_repo/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepo productRepo;
  ProductBloc({@required this.productRepo});

  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProductEvent) {
      yield ProductLoadingState();
      try {
        List<ProductModel> products = await productRepo.getProducts();
        yield ProductLoadedState(products: products);
      } catch (e) {
        yield ProductErrorState(message: e.toString());
      }
    }
  }
}

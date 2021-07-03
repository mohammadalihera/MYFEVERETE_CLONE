import 'package:MyFeveretClone/models/trending_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MyFeveretClone/bloc/trending_product_bloc/trending_product_event.dart';
import 'package:MyFeveretClone/bloc/trending_product_bloc/trending_product_state.dart';
import 'package:MyFeveretClone/data/trending_products_repo/trending_product_repo.dart';

class TrendignProductBloc
    extends Bloc<TrendingProductEvent, TrendingProductState> {
  TrendingProductRepo productRepo;
  TrendignProductBloc({@required this.productRepo});

  TrendingProductState get initialState => TrendingProductInitialState();

  @override
  Stream<TrendingProductState> mapEventToState(
      TrendingProductEvent event) async* {
    if (event is FetchProductEvent) {
      yield ProductLoadingState();
      try {
        List<TrendingProductsModel> trendingProducts =
            await productRepo.getProducts();
        yield TrendingProductLoadedState(trendingProducts: trendingProducts);
      } catch (e) {
        yield TrendingProductErrorState(message: e.toString());
      }
    }
  }
}

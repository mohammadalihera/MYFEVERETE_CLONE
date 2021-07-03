import 'package:MyFeveretClone/models/trending_sellers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MyFeveretClone/bloc/seller_bloc/seller_event.dart';
import 'package:MyFeveretClone/bloc/seller_bloc/seller_state.dart';
import 'package:MyFeveretClone/data/trending_seller/trending_seller_repo.dart';

class SellerBloc extends Bloc<SellerEvent, SellerState> {
  TrendingSellerRepo sellerRepo;
  SellerBloc({@required this.sellerRepo});

  SellerState get initialState => SellerInitialState();

  @override
  Stream<SellerState> mapEventToState(SellerEvent event) async* {
    if (event is FetchSellerEvent) {
      yield SellerLoadingState();
      try {
        List<TrendingSellersModel> seller = await sellerRepo.getSellers();
        yield SellerLoadedState(sellers: seller);
      } catch (e) {
        yield SellerErrorState(message: e.toString());
      }
    }
  }
}

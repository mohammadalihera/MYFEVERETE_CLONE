import 'package:MyFeveretClone/models/new_shop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MyFeveretClone/bloc/shop_bloc/shop_event.dart';
import 'package:MyFeveretClone/bloc/shop_bloc/shop_state.dart';
import 'package:MyFeveretClone/data/shop_repo/new_shop_repo.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  NewShopRepo shopRepo;
  ShopBloc({@required this.shopRepo});

  ShopState get initialState => ShopInitialState();

  @override
  Stream<ShopState> mapEventToState(ShopEvent event) async* {
    if (event is FetchShopEvent) {
      yield ShopLoadingState();
      try {
        List<NewShopModel> shops = await shopRepo.getShops();
        yield ShopLoadedState(shops: shops);
      } catch (e) {
        yield ShopErrorState(message: e.toString());
      }
    }
  }
}

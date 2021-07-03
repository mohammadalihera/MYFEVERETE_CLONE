import 'package:flutter/material.dart';
import 'package:MyFeveretClone/bloc/shop_bloc/shop_bloc.dart';
import 'package:MyFeveretClone/bloc/shop_bloc/shop_event.dart';
import 'package:MyFeveretClone/bloc/shop_bloc/shop_state.dart';
import 'package:MyFeveretClone/widgets/loading.dart';
import 'package:MyFeveretClone/widgets/buildError.dart';
import 'package:MyFeveretClone/widgets/shop/buildHintList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewShop extends StatefulWidget {
  @override
  _NewShopState createState() => _NewShopState();
}

class _NewShopState extends State<NewShop> {
  ShopBloc sellerBloc;
  @override
  void initState() {
    sellerBloc = BlocProvider.of<ShopBloc>(context);
    sellerBloc.add(FetchShopEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 10),
      height: 220,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, left: 5),
            child: Text(
              'New Shops',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 170,
            child: BlocBuilder<ShopBloc, ShopState>(builder: (context, state) {
              if (state is ShopInitialState) {
                return buildLoading();
              } else if (state is ShopLoadingState) {
                return buildLoading();
              } else if (state is ShopLoadedState) {
                return buildHintList(state.shops);
              } else if (state is ShopErrorState) {
                return buildError(state.message);
              }
            }),
          )
        ],
      ),
    );
  }
}

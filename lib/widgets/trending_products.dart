import 'package:flutter/material.dart';
import 'package:MyFeveretClone/bloc/trending_product_bloc/trending_product_bloc.dart';
import 'package:MyFeveretClone/bloc/trending_product_bloc/trending_product_event.dart';
import 'package:MyFeveretClone/bloc/trending_product_bloc/trending_product_state.dart';
import 'package:MyFeveretClone/widgets/loading.dart';
import 'package:MyFeveretClone/widgets/buildError.dart';
import 'package:MyFeveretClone/widgets/trending_product_list/buildHintList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingProducts extends StatefulWidget {
  @override
  _TrendingProductsState createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts> {
  TrendignProductBloc trendingProductBloc;
  @override
  void initState() {
    trendingProductBloc = BlocProvider.of<TrendignProductBloc>(context);
    trendingProductBloc.add(FetchProductEvent());
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
              'Trending Products',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 170,
            child: BlocBuilder<TrendignProductBloc, TrendingProductState>(
                builder: (context, state) {
              if (state is TrendingProductInitialState) {
                return buildLoading();
              } else if (state is ProductLoadingState) {
                return buildLoading();
              } else if (state is TrendingProductLoadedState) {
                return buildHintList(state.trendingProducts);
              } else if (state is TrendingProductErrorState) {
                return buildError(state.message);
              }
            }),
          )
        ],
      ),
    );
  }
}

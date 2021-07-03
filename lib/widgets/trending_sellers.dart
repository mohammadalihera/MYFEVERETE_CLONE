import 'package:flutter/material.dart';
import 'package:MyFeveretClone/bloc/seller_bloc/seller_bloc.dart';
import 'package:MyFeveretClone/bloc/seller_bloc/seller_event.dart';
import 'package:MyFeveretClone/bloc/seller_bloc/seller_state.dart';
import 'package:MyFeveretClone/widgets/loading.dart';
import 'package:MyFeveretClone/widgets/buildError.dart';
import 'package:MyFeveretClone/widgets/trending_seller_list/buildHintList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingSellers extends StatefulWidget {
  @override
  _TrendingSellersState createState() => _TrendingSellersState();
}

class _TrendingSellersState extends State<TrendingSellers> {
  SellerBloc sellerBloc;
  @override
  void initState() {
    sellerBloc = BlocProvider.of<SellerBloc>(context);
    sellerBloc.add(FetchSellerEvent());
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
              'Trending Sellers',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 170,
            child:
                BlocBuilder<SellerBloc, SellerState>(builder: (context, state) {
              if (state is SellerInitialState) {
                return buildLoading();
              } else if (state is SellerLoadingState) {
                return buildLoading();
              } else if (state is SellerLoadedState) {
                return buildHintList(state.sellers);
              } else if (state is SellerErrorState) {
                return buildError(state.message);
              }
            }),
          )
        ],
      ),
    );
  }
}

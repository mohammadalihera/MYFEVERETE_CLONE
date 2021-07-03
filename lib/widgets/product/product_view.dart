import 'package:flutter/material.dart';
import 'package:MyFeveretClone/bloc/product_bloc/product_bloc.dart';
import 'package:MyFeveretClone/bloc/product_bloc/product_event.dart';
import 'package:MyFeveretClone/bloc/product_bloc/product_state.dart';
import 'package:MyFeveretClone/widgets/loading.dart';
import 'package:MyFeveretClone/widgets/buildError.dart';
import 'package:MyFeveretClone/widgets/product/buildViewList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatefulWidget {
  int pNum;
  ProductView({this.pNum});
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductBloc productBloc;
  @override
  void initState() {
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc.add(FetchProductEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductInitialState) {
            return buildLoading();
          } else if (state is ProductLoadingState) {
            return buildLoading();
          } else if (state is ProductLoadedState) {
            return buildViewList(state.products, widget.pNum);
          } else if (state is ProductErrorState) {
            return buildError(state.message);
          }
        }),
      ],
    );
  }
}

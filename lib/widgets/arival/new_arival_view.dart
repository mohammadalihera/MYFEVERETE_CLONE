import 'package:flutter/material.dart';
import 'package:MyFeveretClone/bloc/arival_bloc/arival_bloc.dart';
import 'package:MyFeveretClone/bloc/arival_bloc/arival_event.dart';
import 'package:MyFeveretClone/bloc/arival_bloc/arival_state.dart';
import 'package:MyFeveretClone/widgets/loading.dart';
import 'package:MyFeveretClone/widgets/buildError.dart';
import 'package:MyFeveretClone/widgets/arival/buildHintList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewArival extends StatefulWidget {
  @override
  _NewArivalState createState() => _NewArivalState();
}

class _NewArivalState extends State<NewArival> {
  ArivalBloc arivalBloc;
  @override
  void initState() {
    arivalBloc = BlocProvider.of<ArivalBloc>(context);
    arivalBloc.add(FetchArivalEvent());
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
              'New Arivals',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 170,
            child:
                BlocBuilder<ArivalBloc, ArivalState>(builder: (context, state) {
              if (state is ArivalInitialState) {
                return buildLoading();
              } else if (state is ArivalLoadingState) {
                return buildLoading();
              } else if (state is ArivalLoadedState) {
                return buildHintList(state.arivals);
              } else if (state is ArivalErrorState) {
                return buildError(state.message);
              }
            }),
          )
        ],
      ),
    );
  }
}

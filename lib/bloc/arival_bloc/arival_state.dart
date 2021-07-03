import 'package:MyFeveretClone/models/new_arival_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ArivalState extends Equatable {}

class ArivalInitialState extends ArivalState {
  @override
  List<Object> get props => [];
}

class ArivalLoadingState extends ArivalState {
  @override
  List<Object> get props => [];
}

class ArivalLoadedState extends ArivalState {
  List<NewArivalModel> arivals;
  ArivalLoadedState({@required this.arivals});
  @override
  List<Object> get props => null;
}

class ArivalErrorState extends ArivalState {
  String message;
  ArivalErrorState({@required this.message});
  @override
  List<Object> get props => null;
}

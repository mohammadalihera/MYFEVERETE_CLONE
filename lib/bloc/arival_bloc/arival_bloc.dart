import 'package:MyFeveretClone/models/new_arival_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MyFeveretClone/bloc/arival_bloc/arival_event.dart';
import 'package:MyFeveretClone/bloc/arival_bloc/arival_state.dart';
import 'package:MyFeveretClone/data/arival_repo/arival_repo.dart';

class ArivalBloc extends Bloc<ArivalEvent, ArivalState> {
  ArivalRepo arivalRepo;
  ArivalBloc({@required this.arivalRepo});

  ArivalState get initialState => ArivalInitialState();

  @override
  Stream<ArivalState> mapEventToState(ArivalEvent event) async* {
    if (event is FetchArivalEvent) {
      yield ArivalLoadingState();
      try {
        List<NewArivalModel> arivals = await arivalRepo.getArivals();
        yield ArivalLoadedState(arivals: arivals);
      } catch (e) {
        yield ArivalErrorState(message: e.toString());
      }
    }
  }
}

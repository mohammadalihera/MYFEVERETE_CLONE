import 'package:equatable/equatable.dart';

abstract class SellerEvent extends Equatable {}

class FetchSellerEvent extends SellerEvent {
  @override
  List<Object> get props => [];
}

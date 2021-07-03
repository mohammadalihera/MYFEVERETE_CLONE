import 'package:equatable/equatable.dart';

abstract class ShopEvent extends Equatable {}

class FetchShopEvent extends ShopEvent {
  @override
  List<Object> get props => [];
}

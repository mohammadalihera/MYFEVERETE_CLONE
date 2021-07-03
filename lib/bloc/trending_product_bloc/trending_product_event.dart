import 'package:equatable/equatable.dart';

abstract class TrendingProductEvent extends Equatable {}

class FetchProductEvent extends TrendingProductEvent {
  @override
  List<Object> get props => [];
}

import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {}

class FetchProductEvent extends ProductEvent {
  @override
  List<Object> get props => [];
}

part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveFromCart extends CartEvent {
  final ProductDataModel itemInCart;

  RemoveFromCart(this.itemInCart);
}

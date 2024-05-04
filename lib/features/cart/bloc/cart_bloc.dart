import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/cart_items.dart';
import 'package:grocery_app_bloc/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCart>(removeFromCart);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> removeFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    cartItems.remove(event.itemInCart);
    emit(CartSuccessState(cartItems: List.from(cartItems)));
  }
}

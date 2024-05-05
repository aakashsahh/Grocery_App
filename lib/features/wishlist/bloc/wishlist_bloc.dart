import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/wishlist_items.dart';
import 'package:grocery_app_bloc/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>((wishlistInitialEvent));
    on<RemoveFromWishlist>(removeFromWishlist);
  }
  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishListItems));
  }

  FutureOr<void> removeFromWishlist(RemoveFromWishlist event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.itemInWishlist);
    emit(WishlistSuccessState(wishlistItems: List.from(wishListItems)));
  }
}

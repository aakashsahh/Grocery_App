import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    //for product cart button clicked
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    //for product wishlist button clicked
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);

    //To navigate to cart page
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);

    //To navigate to wishlist page
    on<HomeWishlistNavigateEvent>(homeWishlistNavigateEvent);
  }
  //method for product cart button clicked
  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeblocState> emit) {}

  //method for product wishlist button clicked
  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeblocState> emit) {}

  //Method To navigate to cart page
  FutureOr<void> homeCartNavigateEvent(HomeCartNavigateEvent event, Emitter<HomeblocState> emit) {
    print("Cart navigation clicked");
  }

  //Method To navigate to Wishlist page
  FutureOr<void> homeWishlistNavigateEvent(HomeWishlistNavigateEvent event, Emitter<HomeblocState> emit) {
    print("wishlist navigation clicked");
  }
}

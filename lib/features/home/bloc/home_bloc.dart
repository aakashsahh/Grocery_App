import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/grocery_data.dart';
import 'package:grocery_app_bloc/features/home/models/home_product_data_model.dart';

import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIntialEvent>(homeIntialEvent);
    //for product cart button clicked
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    //for product wishlist button clicked
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);

    //To navigate to cart page
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);

    //To navigate to wishlist page
    on<HomeWishlistNavigateEvent>(homeWishlistNavigateEvent);
  }

  FutureOr<void> homeIntialEvent(event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(
      id: e['id'], 
      name: e['name'],
      description: e['description'],
      imageUrl: e['imageUrl'],
      price: e['price'])).toList()));
  }

  //method for product cart button clicked
  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {}

  //method for product wishlist button clicked
  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {}

  //Method To navigate to cart page
  FutureOr<void> homeCartNavigateEvent(HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart navigation clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  //Method To navigate to Wishlist page
  FutureOr<void> homeWishlistNavigateEvent(HomeWishlistNavigateEvent event, Emitter<HomeState> emit) {
    print("wishlist navigation clicked");
    emit(HomeNavigateToWishListPageActionState());
  }
}

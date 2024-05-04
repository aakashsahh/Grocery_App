part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeIntialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

// for cart button click event
class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

// To navigate to wishlist page on click
class HomeWishlistNavigateEvent extends HomeEvent {}

// To navigate to cart page on click
class HomeCartNavigateEvent extends HomeEvent {}

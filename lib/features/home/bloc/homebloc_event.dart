part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}
class HomeProductWishlistButtonClickedEvent extends HomeblocEvent{

}
// for cart button click event 
class HomeProductCartButtonClickedEvent extends HomeblocEvent{

}
// To navigate to wishlist page on click
class HomeWishlistNavigateEvent extends HomeblocEvent{

}
// To navigate to cart page on click 
class HomeCartNavigateEvent extends HomeblocEvent{

}
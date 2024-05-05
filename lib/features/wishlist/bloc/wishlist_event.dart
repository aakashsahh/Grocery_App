part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class RemoveFromWishlist extends WishlistEvent {
  final ProductDataModel itemInWishlist;

  RemoveFromWishlist(this.itemInWishlist);
}

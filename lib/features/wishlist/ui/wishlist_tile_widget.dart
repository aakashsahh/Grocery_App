import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/home/models/home_product_data_model.dart';
import 'package:grocery_app_bloc/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget({super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(productDataModel.imageUrl),
        title: Text(productDataModel.name),
        subtitle: Text('\$${productDataModel.price}'),
        trailing: IconButton(
          onPressed: () {
            wishlistBloc.add(RemoveFromWishlist(productDataModel));
          },
          icon: const Icon(Icons.delete),
        ));
  }
}

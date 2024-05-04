import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app_bloc/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(productDataModel.imageUrl),
        title: Text(productDataModel.name),
        subtitle: Text('\$${productDataModel.price}'),
        trailing: IconButton(
          onPressed: () {
            cartBloc.add(RemoveFromCart(productDataModel));
          },
          icon: const Icon(Icons.delete),
        ));
  }
}

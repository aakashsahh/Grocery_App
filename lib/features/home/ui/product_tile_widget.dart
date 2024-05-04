import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/home/bloc/home_bloc.dart';
import 'package:grocery_app_bloc/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc  homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productDataModel.imageUrl),
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDataModel.description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                       homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

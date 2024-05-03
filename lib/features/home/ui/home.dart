import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/cart/ui/cart.dart';
import 'package:grocery_app_bloc/features/home/bloc/home_bloc.dart';
import 'package:grocery_app_bloc/features/home/ui/product_tile_widget.dart';
import 'package:grocery_app_bloc/features/wishlist/ui/wishList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc = HomeBloc();
    homeBloc.add(HomeIntialEvent());
    super.initState();
  }

  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishList()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState _:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState :
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text("Grocery App"),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  )
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(productDataModel: successState.products[index]);
                  }),
            );

          case HomeErrorState :
            return const Scaffold(
              body: Center(
                child: Text("Something Went Wrong"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/home/bloc/homebloc_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeblocBloc homeblocBloc = HomeblocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      bloc: homeblocBloc,
      // listenWhen: (previous, current) {},
      // buildWhen: (previous, current) {},
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Grocery App"),
            actions: [
              IconButton(
                onPressed: () {
                  homeblocBloc.add(HomeWishlistNavigateEvent());
                },
                icon: const Icon(Icons.favorite_border_outlined),
              ),
              IconButton(
                onPressed: () {
                  homeblocBloc.add(HomeWishlistNavigateEvent());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
              )
            ],
          ),
        );
      },
    );
  }
}

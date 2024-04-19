part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {}

abstract class HomeActionState extends HomeblocState{}


final class HomeblocInitial extends HomeblocState {}

class HomeLoadingState extends HomeblocState{}

class HomeLoadedSucessState extends HomeblocState{}

class HomeErrorState extends HomeblocState{}

class HomeNavigateToWishListPageActionState extends HomeActionState{}

class HomeNavigateToWCartPageActionState extends HomeActionState{}
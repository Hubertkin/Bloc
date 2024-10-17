part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocState {}

sealed class HomeblocActionState extends HomeblocState {}

final class HomeblocInitial extends HomeblocState {}

class HomeLoadingState extends HomeblocState {}

class HomeLoadingSuccessState extends HomeblocState {
  List<ProductDataModel> products;
  HomeLoadingSuccessState({required this.products});
}

class HomeErrorState extends HomeblocState {}

class HomeNavigatetoWishlistPageActionState extends HomeblocActionState {}

class HomeNavigateToCartPageActionState extends HomeblocActionState {}

class HomeProductItemCartedActionState extends HomeblocActionState {}

class HomeProductItemWishlistedActionState extends HomeblocActionState {}

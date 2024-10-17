part of 'cartbloc_bloc.dart';

@immutable
sealed class CartblocState {}

sealed class CartblocActionState extends CartblocState {}

final class CartblocInitial extends CartblocState {}

final class CartSuccessState extends CartblocState{
  final List<ProductDataModel> cartProducts;

  CartSuccessState({required this.cartProducts});
}

final class CartItemRemovedActionState extends CartblocActionState{
  final ProductDataModel productDataModel;

  CartItemRemovedActionState({required this.productDataModel});
}



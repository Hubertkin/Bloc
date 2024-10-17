part of 'cartbloc_bloc.dart';

@immutable
sealed class CartblocEvent {}

final class CartblocInitialEvent extends CartblocEvent {}

final class CartblocRemoveFromCartEvent extends CartblocEvent {
  final ProductDataModel productDataModel;

  CartblocRemoveFromCartEvent({required this.productDataModel});

}

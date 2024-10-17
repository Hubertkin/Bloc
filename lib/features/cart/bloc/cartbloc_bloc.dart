import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/data/cart_data.dart';
import 'package:meta/meta.dart';

import '../../home/models/home_product_data_model.dart';

part 'cartbloc_event.dart';
part 'cartbloc_state.dart';

class CartblocBloc extends Bloc<CartblocEvent, CartblocState> {
  CartblocBloc() : super(CartblocInitial()) {
    on<CartblocInitialEvent>(cartblocInitialEvent);
    on<CartblocRemoveFromCartEvent>(cartblocRemoveFromCartEvent);
  }

  FutureOr<void> cartblocInitialEvent(
      CartblocInitialEvent event, Emitter<CartblocState> emit) {
    emit(CartSuccessState(cartProducts: cartProducts));
  }

  FutureOr<void> cartblocRemoveFromCartEvent(
      CartblocRemoveFromCartEvent event, Emitter<CartblocState> emit)  {
    final prodToRemoveIndex =
        cartProducts.indexWhere((element) => element == event.productDataModel);
    cartProducts.removeAt(prodToRemoveIndex);
    emit(CartItemRemovedActionState(productDataModel: event.productDataModel));
   
    // emit(CartSuccessState(cartProducts: cartProducts));
  }
}

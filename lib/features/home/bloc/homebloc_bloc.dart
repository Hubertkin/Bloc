import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/data/cart_data.dart';
import 'package:flutter_bloc_project/data/grocery_data.dart';
import 'package:flutter_bloc_project/data/wishlist_data.dart';
import 'package:meta/meta.dart';

import '../models/home_product_data_model.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<HomeblocInitialEvent>(homeblocInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeblocInitialEvent(
      HomeblocInitialEvent event, Emitter<HomeblocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadingSuccessState(
        products: GroceryData.groceryProducts
            .map((prod) => ProductDataModel(
                  id: prod['id'],
                  name: prod['name'],
                  price: prod['price'],
                  decription: prod['description'],
                  imageUrl: prod['imageUrl'],
                ))
            .toList()));
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeblocState> emit) {
    debugPrint("Wishlist NavigateClicked");
    emit(HomeNavigatetoWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeblocState> emit) {
    debugPrint("Cart Navigate Clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeblocState> emit) {
    debugPrint("Cart Button Clicked");
    cartProducts.add(event.clickedProduct);
    debugPrint(event.clickedProduct.name);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event,
      Emitter<HomeblocState> emit) {
    debugPrint("Wishlist Button Clicked");
    wishlistProducts.add(event.clickedProduct);
    debugPrint(wishlistProducts.length.toString());
    debugPrint(event.clickedProduct.name);
    emit(HomeProductItemWishlistedActionState());
  }
}

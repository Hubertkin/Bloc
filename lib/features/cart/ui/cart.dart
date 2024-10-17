import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/data/cart_data.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cartbloc_bloc.dart';

import 'package:flutter_bloc_project/features/cart/ui/cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartblocBloc cartblocBloc = CartblocBloc();
  @override
  void initState() {
    cartblocBloc.add(CartblocInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer<CartblocBloc, CartblocState>(
        bloc: cartblocBloc,
        listenWhen: (previous, current) => current is CartblocActionState,
        buildWhen: (previous, current) => current is !CartblocActionState,
        listener: (context, state) {
          if (state is CartItemRemovedActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar( SnackBar(content: Text('${state.productDataModel.name} removed from cart')));
                cartblocBloc.add(CartblocInitialEvent());
          }
         
        },
        builder: (context, state) {
          
          switch (state.runtimeType) {
            case CartSuccessState:
            final successState = state as CartSuccessState;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CartTileWidget(cartblocBloc: cartblocBloc,
                    productDataModel: successState.cartProducts[index],
                  );
                },
                itemCount: successState.cartProducts.length,
              );
            default:
              return const Center(
                child: Text('No Items in Cart'),
              );
          }
        },
      ),
    );
  }
}

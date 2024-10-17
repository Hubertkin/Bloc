import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/home/bloc/homebloc_bloc.dart';
import 'package:flutter_bloc_project/features/home/ui/product_tile_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeblocBloc homeblocBloc = HomeblocBloc();
  @override
  void initState() {
    homeblocBloc.add(HomeblocInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      bloc: homeblocBloc,
      listenWhen: (previous, current) => current is HomeblocActionState,
      buildWhen: (previous, current) => current is! HomeblocActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.pushNamed(context, '/cart');
        } else if (state is HomeNavigatetoWishlistPageActionState) {
          Navigator.pushNamed(context, '/wishlist');
        }
        else if( state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to cart')));
        }
        else if( state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to wishlist')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Bloc_Project'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeblocBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                      onPressed: () {
                        homeblocBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                ],
              ),
              body: ListView.builder( itemBuilder: (context, index) { return
                ProductTile( homeblocBloc: homeblocBloc,
                  productDataModel: successState.products[index],
                );
                
              },itemCount: successState.products.length,
               ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error Occured,'),
              ),
            );
          default:
            return const Scaffold(
              body: Center(
                child: Text('Error Occured, Fix needed'),
              ),
            );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cartbloc_bloc.dart';
import 'package:flutter_bloc_project/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartblocBloc cartblocBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartblocBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                productDataModel.imageUrl,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          productDataModel.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          productDataModel.decription,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ ${productDataModel.price}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // homeblocBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: cartDataModel));
                  },
                  icon: const Icon(Icons.favorite_border_outlined),
                ),
                IconButton(
                    onPressed: () {
                      cartblocBloc.add(CartblocRemoveFromCartEvent(productDataModel: productDataModel));
                    },
                    icon: const Icon(Icons.shopping_cart)),
              ],
            )
          ],
        ),
      ]),
    );
  }
}

import 'package:final_project/components/my_quantity_selector.dart';
import 'package:final_project/models/cart_item.dart';
import 'package:final_project/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  //name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      SizedBox(
                          height: 30,
                          child: Text(
                            cartItem.food.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          )),

                      //food price
                      Text(
                        "đ${cartItem.food.price}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      QuantitySelector(
                        food: cartItem.food,
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        },
                        quantity: cartItem.quantity,
                        onIncrement: () {
                          restaurant.addToCart(
                              cartItem.food, cartItem.selectedAddons);
                        },
                      ),
                    ],
                  ),

                  // increment or decrement quantiy
                ],
              ),
            ),

            //addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              //addon name
                              Text(addon.name),

                              //addon price
                              Text("  (đ${addon.price})")
                            ],
                          ),
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          onSelected: (value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

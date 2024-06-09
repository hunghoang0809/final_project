import "package:final_project/components/my_button.dart";
import "package:final_project/models/restaurant.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../models/food.dart";

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    //initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //food image
              children: [
                SizedBox(
                  width: double.infinity, // This ensures full width
                  height: 280, // This reduces the height
                  child: Image.asset(widget.food.imagePath, fit: BoxFit.cover),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name

                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      //food price
                      Text(
                        'đ${widget.food.price}',
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      // food description
                      Text(
                        widget.food.description,
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            //get individual addon
                            Addon addon = widget.food.availableAddons[index];

                            //return checkbox UI
                            return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text(
                                  "đ${addon.price}",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                });
                          },
                        ),
                      )

                      //addons
                    ],
                  ),
                ),

                //button -> add to cart

                MyButton(
                    text: "Add to card",
                    onTap: () => addToCart(widget.food, widget.selectedAddons)),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}

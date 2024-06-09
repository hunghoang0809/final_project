import "package:collection/collection.dart";
import "package:final_project/models/cart_item.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "food.dart";

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //Espresso
    Food(
        name: "Burnt Caramel Latte",
        description:
            "Espresso with Burnt Caramel sauce and steamed milk. Topped with Burnt Caramel whipped cream and Burnt Caramel powder.",
        imagePath:
            'lib/images/espressos/Summer2_Burnt-Caramel-Oatmilk-Latte-768x768.jpg',
        price: 85.000,
        category: FoodCategory.espressos,
        availableAddons: [
          Addon(name: 'Tall', price: 10.000),
          Addon(name: 'Grande', price: 22.000),
          Addon(name: 'Venti', price: 34.000)
        ]),

    Food(
        name: "Flat White",
        description:
            "Smooth ristretto shots of espresso get perfect amount of steamed whole milk to create a not-too-strong, not-too-creamy, just-right-flavor.",
        imagePath: 'lib/images/espressos/14.Flat-white1080-768x768.png',
        price: 70.000,
        category: FoodCategory.espressos,
        availableAddons: [
          Addon(name: 'Tall', price: 10.000),
          Addon(name: 'Grande', price: 22.000),
          Addon(name: 'Venti', price: 34.000)
        ]),

    Food(
        name: "Caffe Americano",
        description:
            "Espresso shots topped with hot water create a light layer of crema culminating in this wonderfully rich cup with depth and nuance. Pro tip: For and additional boost, ask your barista to try this with an extra shots.",
        imagePath: 'lib/images/espressos/Screenshot 2024-06-05 165254.png',
        price: 55.000,
        category: FoodCategory.espressos,
        availableAddons: [
          Addon(name: 'Tall', price: 10.000),
          Addon(name: 'Grande', price: 22.000),
          Addon(name: 'Venti', price: 34.000)
        ]),

    Food(
        name: "Caffe Mocha",
        description:
            "Our rich, full-bodied espresso combined with bittersweet mocha sauce and steamed milk then topped with sweetened whipped cream.",
        imagePath: 'lib/images/espressos/10.Caffe-Mocha1080-768x768.png',
        price: 70.000,
        category: FoodCategory.espressos,
        availableAddons: [
          Addon(name: 'Tall', price: 10.000),
          Addon(name: 'Grande', price: 22.000),
          Addon(name: 'Venti', price: 34.000)
        ]),

    Food(
        name: "Caramel Macchiato",
        description:
            "Freshly steamed milk with vanilla-flavored syrup marked with espresso and topped with a caramel drizzle for an oh-so-sweet finish",
        imagePath: 'lib/images/espressos/11.Caramel-Macchiato1080-768x768.png',
        price: 75.000,
        category: FoodCategory.espressos,
        availableAddons: [
          Addon(name: 'Tall', price: 10.000),
          Addon(name: 'Grande', price: 22.000),
          Addon(name: 'Venti', price: 34.000)
        ]),

    //food
    Food(
        name: "Chicken Thousand Island Sandwich",
        description: "Sandwich filled with chicken thousand Island salad.",
        imagePath:
            'lib/images/foods/Spring24_Chicken-Thousand-Island-Sandwich-Return_core-768x768.jpg',
        price: 82.000,
        category: FoodCategory.foods,
        availableAddons: [
          Addon(name: 'Culery', price: 0),
          Addon(name: 'Warm up', price: 0),
          Addon(name: 'Chill Sauce', price: 0),
          Addon(name: 'Ketchup', price: 0)
        ]),
    Food(
        name: "Chicken Ham Cheese Croissant",
        description:
            "French butter croissant with chicken ham and melted mature cheddar cheese",
        imagePath:
            'lib/images/foods/Summer2_Chicken-Ham-Cheese-Croissant_GBG-768x768.jpg',
        price: 75.000,
        category: FoodCategory.foods,
        availableAddons: [
          Addon(name: 'Culery', price: 0),
          Addon(name: 'Warm up', price: 0),
          Addon(name: 'Chill Sauce', price: 0),
          Addon(name: 'Ketchup', price: 0)
        ]),
    Food(
        name: "Parisian Ham 3 Cheeses Multigrain",
        description:
            "Multigrain read with Parisian ham with Emmental cheese, cheddar cheese and gouda cheese.",
        imagePath: 'lib/images/espressos/11.Caramel-Macchiato1080-768x768.png',
        price: 45.000,
        category: FoodCategory.foods,
        availableAddons: [
          Addon(name: 'Culery', price: 0),
          Addon(name: 'Warm up', price: 0),
        ]),
    Food(
        name: "Parisian Ham 4 Cheese Multigrain Bagel",
        description:
            "Multigrain bagel with Paris ham and 4 cheeses (emmental, cheddar, edam, gouda).",
        imagePath:
            'lib/images/foods/Summer2_Parisian-Ham-4-Cheese-Multigrain-Bagel-768x768.jpg',
        price: 90.000,
        category: FoodCategory.foods,
        availableAddons: [
          Addon(name: 'Culery', price: 0),
          Addon(name: 'Warm up', price: 0),
          Addon(name: 'Chill Sauce', price: 0),
          Addon(name: 'Ketchup', price: 0)
        ]),
    Food(
        name: "Cold Cut & Cheese Platter",
        description:
            "Salami, parma ham, Italian coppa, brie cheese, cheddar cheese and emmental cheese served with olive and kraftkorn bread.",
        imagePath: 'lib/images/foods/ExclusiveICONonGreen_Item18-768x768.jpg',
        price: 150.000,
        category: FoodCategory.foods,
        availableAddons: [
          Addon(name: 'Culery', price: 0),
          Addon(name: 'Warm up', price: 0),
          Addon(name: 'Chill Sauce', price: 0),
          Addon(name: 'Ketchup', price: 0)
        ]),

    //cake
    Food(
        name: "Dark Chocolate with Custard Bun",
        description:
            "A dark chocolate bun filled with butter custard cream topped with butter and icing sugar.",
        imagePath: 'lib/images/cakes/Choc-Bun-600x600.png',
        price: 80.000,
        category: FoodCategory.cakes,
        availableAddons: [
          Addon(name: 'Culery', price: 0),
        ]),

    Food(
        name: "Skinny Blueberry Muffin",
        description: "A healthy alternative blueberry muffin.",
        imagePath:
            'lib/images/cakes/15.Skinny-Blueberry-Muffin1080-1-768x768.png',
        price: 55.000,
        category: FoodCategory.cakes,
        availableAddons: [
          Addon(name: 'Culery', price: 0),
        ]),

    Food(
        name: "Toaster Pancake",
        description:
            "Fluffy pancake served with maple syrup and whipped cream.",
        imagePath: 'lib/images/cakes/17.Pancake1080-768x768.png',
        price: 67.000,
        category: FoodCategory.cakes,
        availableAddons: [
          Addon(name: 'Culery', price: 0),
        ]),

    //teas
    Food(
        name: "Iced Pure Matcha Latte",
        description:
            "An elevated no-sugar matcha powder, infused with milk, syrup and ice, gives customers flexibility to customize their very own cup of pure matcha latte",
        imagePath: 'lib/images/teas/81.Iced-Green-Tea-Latte1080-768x768.png',
        price: 75.000,
        category: FoodCategory.teas,
        availableAddons: [
          Addon(name: 'Tall', price: 10.000),
          Addon(name: 'Grande', price: 22.000),
          Addon(name: 'Venti', price: 34.000)
        ]),

    Food(
        name: "Iced Shaken Hibiscus Tea with Pomegranate Pearls",
        description:
            "Hibiscus Tea mixed with Pomergranate pearls and lemonade shaken with ice.",
        imagePath:
            'lib/images/teas/78.Ice-Shaken-Hibicus-Tea-wih-Pomegranate-Pearls1080-768x768.png',
        price: 75.000,
        category: FoodCategory.teas,
        availableAddons: [
          Addon(name: 'Tall', price: 10.000),
          Addon(name: 'Grande', price: 22.000),
          Addon(name: 'Venti', price: 34.000)
        ]),

    Food(
        name: "Iced Full-leaf Emperor’s Clouds & Mist Tea ",
        description:
            "A single-origin pure green tea with light, toasty-sweet notes with ice.",
        imagePath: 'lib/images/teas/135.Iced-Full-Leaf-Emperor1080-600x600.png',
        price: 67.000,
        category: FoodCategory.teas,
        availableAddons: [
          Addon(name: 'Tall', price: 10.000),
          Addon(name: 'Grande', price: 22.000),
          Addon(name: 'Venti', price: 34.000)
        ]),
  ];

  //user cart
  final List<CartItem> _cart = [];

  // delivery address
  String _deliveryAddress = '100 Phan Dinh Phung';
  /*

    GETTER

   */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*

    OPERATIONS

   */

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood & isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwisem, add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartItem != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
  /*

   HELPERS
   */

  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt,");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattededDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattededDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(" Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "đ${price.toStringAsFixed(2)}";
  }

  //format list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name} (đ${addon.price})").join(", ");
  }
}

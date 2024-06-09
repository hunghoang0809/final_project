import 'package:final_project/components/my_receipt.dart';
import 'package:final_project/models/restaurant.dart';
import 'package:final_project/services/auth/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgessPage extends StatefulWidget {
  const DeliveryProgessPage({super.key});

  @override
  State<DeliveryProgessPage> createState() => _DeliveryProgessPageState();
}

class _DeliveryProgessPageState extends State<DeliveryProgessPage> {
  //get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  //custom bottom Nav Bar - mesage / call delivery driver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            width: 10,
          ),

          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hung Hoang",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                'Driver',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),

          const Spacer(),

          Row(
            children: [
              //message button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(
                width: 10,
              ),
              //call button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

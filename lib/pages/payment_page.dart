import 'package:final_project/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //user wants to pay

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(children: [
              Text("Cart Number: $cardNumber"),
              Text("Expiry Date: $expiryDate"),
              Text("Card Holder name: $cardHolderName"),
              Text("CVV: $cvvCode"),
            ]),
          ),
          actions: [
            //cancel button

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            //Yes button
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeliveryProgessPage()),
              ),
              child: const Text("Yes"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          // credit card
          Container(
            height: 300,
            child: CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: ((p0) {}),
            ),
          ),

          //credit card form
          Container(
            height: 350, // Đặt kích thước cố định cho form
            child: CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey,
            ),
          ),

          const SizedBox(height: 10),

          // Button
          ElevatedButton(
            onPressed: userTappedPay,
            child: Text("Pay now"),
          ),
        ],
      ),
    );
  }
}

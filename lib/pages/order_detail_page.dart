import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editOrder(context),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteOrder(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.id}'),
            const SizedBox(height: 8),
            Text('Date: ${order['date'].toDate()}'),
            const SizedBox(height: 8),
            Text('Order: ${order['order']}'),
            // Thêm các trường khác nếu cần
          ],
        ),
      ),
    );
  }

  void _editOrder(BuildContext context) {
    TextEditingController orderController =
        TextEditingController(text: order['order']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: orderController,
                decoration:
                    const InputDecoration(hintText: "Enter new order details"),
              ),
              // Thêm các trường khác nếu cần
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('order')
                    .doc(order.id)
                    .update({
                  'order': orderController.text,
                  'date': DateTime.now(), // Update date to current time
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Order'),
        content: Text('Are you sure you want to delete this order?'),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('order')
                  .doc(order.id)
                  .delete();
              Navigator.pop(context);
              Navigator.pop(context); // Go back to the previous screen
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}

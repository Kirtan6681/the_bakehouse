import 'package:flutter/material.dart';

class BillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final List<Map<String, dynamic>> cartItems = ModalRoute.of(context)?.settings.arguments as List<Map<String, dynamic>>? ?? [];

    double getTotal() {
      return cartItems.fold(0, (sum, item) => sum + (item["price"] as int).toDouble());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Screen'),
      ),
      body: cartItems.isEmpty
          ? const Center(
        child: Text("No items in the cart"),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(item["img"]!),
                  title: Text(item["name"]!),
                  subtitle: Text('Price: \$${(item["price"] as int)}'),
                  trailing: Text('Quantity: 1'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total: \$${getTotal().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

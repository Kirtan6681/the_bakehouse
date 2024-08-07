import 'package:flutter/material.dart';
import '../Utils/global_variables.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double getTotal() {
    return cartList.fold(0, (sum, item) => sum + double.parse(item["price"]!));
  }

  void _navigateToBillScreen() {
    // Convert prices to integer in cartList
    final formattedCartList = cartList.map((item) {
      return {
        "img": item["img"]!,
        "name": item["name"]!,
        "price": int.parse(item["price"]!) // Convert price to integer
      };
    }).toList();

    Navigator.pushNamed(
      context,
      '/bill',
      arguments: formattedCartList,  // Pass formattedCartList as arguments
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: cartList.isEmpty
          ? const Center(
        child: Text("Your Cart is Empty!!!!"),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(cartList[index]["img"]!),
                  title: Text(cartList[index]["name"]!),
                  subtitle: Text(cartList[index]["price"]!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        cartList.removeAt(index);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item removed from cart')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: \$${getTotal().toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: _navigateToBillScreen,
                  child: const Text('Go to Bill'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

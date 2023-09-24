import 'package:flutter/material.dart';
import 'package:store_app/api/cart_api.dart';
import 'package:store_app/models/index.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Carts carts;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    CartAPI.getCarts().then((cartFromServer) => {
          setState(() {
            carts = cartFromServer;
            isLoading = false;
          })
        });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: carts.carts.isEmpty ? 0 : carts.carts.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        title: Text(
          "Product ID : ${carts.carts[index].id}",
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          "Date Order : ${carts.carts[index].date}",
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          Icons.remove_red_eye,
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Cart'),
        ),
        body: Container(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    list(),
                  ],
                ),
        ));
  }
}

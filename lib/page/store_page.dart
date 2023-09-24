import 'package:flutter/material.dart';
import 'package:store_app/api/store_product_api.dart';
import 'package:store_app/models/storeProduct.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late StoreProduct storeProduct;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    StoreProductAPI.getProducts().then((productsFromServer) => {
          setState(() {
            storeProduct = productsFromServer;
            isLoading = false;
          })
        });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: storeProduct.storeProduct.isEmpty
            ? 0
            : storeProduct.storeProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              storeProduct.storeProduct[index].image,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              storeProduct.storeProduct[index].title,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Rate : ${storeProduct.storeProduct[index].rating["rate"]}",
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Store'),
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

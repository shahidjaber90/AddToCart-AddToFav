import 'package:cart_favorite/Local%20Data/LocalData.dart';
import 'package:cart_favorite/Screens/AddToCart.dart';
import 'package:cart_favorite/Screens/AddToFav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List addToCarts = [];
  List addToFav = [];
  List showFav = [];

  void toggleFavorite(int index) {
    setState(() {
      if (showFav.contains(index)) {
        showFav.remove(index);
      } else {
        showFav.add(index);
      }
    });
  }

  void addToCart(Map<String, String> product) {
    setState(() {
      addToCarts.add(product);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 1),
            backgroundColor: Colors.blue.shade900,
            content: const Text(
              'Added to Cart',
              style: TextStyle(color: Colors.white),
            )),
      );
    });
  }

  void addFav(index) {
    if (addToFav.contains(index)) {
      setState(() {
        addToFav.removeAt(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.red.shade800,
              content: Text(
                'Removed from favorites $index',
                style: const TextStyle(color: Colors.white),
              )),
        );
        print('add to fav delete:: $index');
      });
    } else {
      setState(() {
        addToFav.add(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.blue.shade900,
              content: Text(
                'Added to favorites $index',
                style: const TextStyle(color: Colors.white),
              )),
        );
        print('add to fav add:: $index');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addToCarts.isEmpty ? '0' : addToCarts.length.toString()),
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     await Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => AddToFav(addToFav: addToFav),
          //       ),
          //     );
          //     setState(() {});
          //   },
          //   icon: const Icon(
          //     Icons.favorite_border,
          //     color: Colors.white,
          //   ),
          // ),
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddToCart(addToCart: addToCarts),
                ),
              );
              setState(() {});
            },
            icon: const Icon(
              Icons.store_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final isFavorite = showFav.contains(index);
          return ListTile(
            title: Text(product['item']),
            subtitle: Text(product['price']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    toggleFavorite(index);
                    addFav(product);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      addToCart(product);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.blue.shade300,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

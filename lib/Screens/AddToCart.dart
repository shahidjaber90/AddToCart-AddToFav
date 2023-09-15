import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  List addToCart = [];
  AddToCart({super.key, required this.addToCart});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add To Cart',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.addToCart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.addToCart[index]['item']),
            subtitle: Text(widget.addToCart[index]['price']),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    widget.addToCart.removeAt(index);
                    print(widget.addToCart);
                  });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.deepPurple.shade300,
                )),
          );
        },
      ),
    );
  }
}

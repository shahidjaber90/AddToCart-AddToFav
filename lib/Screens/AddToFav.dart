import 'package:flutter/material.dart';

class AddToFav extends StatefulWidget {
  List addToFav = [];
  AddToFav({super.key, required this.addToFav});

  @override
  State<AddToFav> createState() => _AddToFavState();
}

class _AddToFavState extends State<AddToFav> {
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
        itemCount: widget.addToFav.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.addToFav[index]['item']),
            subtitle: Text(widget.addToFav[index]['price']),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    widget.addToFav.removeAt(index);
                    print(widget.addToFav);
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red.shade800,
                )),
          );
        },
      ),
    );
  }
}

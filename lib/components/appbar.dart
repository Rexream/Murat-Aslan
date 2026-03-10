import 'package:flutter/material.dart';

import 'package:stajproje/pages/cart.dart';

AppBar componentAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,

    title: Text(
      "SHOPPING 1000",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: const Color(0xFF141414),
      ),
    ),

    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(
            (context),
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        icon: Row(
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              color: const Color(0xFF141414),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: const Color(0xFF141414),
            ),
          ],
        ),
      ),
    ],
  );
}

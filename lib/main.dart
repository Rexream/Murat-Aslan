import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:stajproje/cart_model/cart_model.dart';
import 'package:stajproje/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],

      child: MaterialApp(
        title: 'SHOPPING APP',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

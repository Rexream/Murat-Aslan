import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:stajproje/cart_model/cart_model.dart';
import 'package:stajproje/components/appbar.dart';
import 'package:stajproje/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Products product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          colors: [
            Color.fromARGB(255, 176, 106, 231),
            Color.fromARGB(255, 166, 112, 232),

            Color.fromARGB(255, 131, 123, 232),
            Color.fromARGB(255, 104, 132, 231),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(36, 20),
          bottomRight: Radius.elliptical(36, 20),
        ),
      ),

      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,

          appBar: componentAppBar(context),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0x9DFFFFFF),
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(40, 40),
                      ),
                    ),

                    child: Hero(
                      tag: product.id ?? 0,

                      child: Image.network(
                        product.images!.first,
                        height: 350,
                        width: double.infinity,

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "${product.title}".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight(700),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "${product.description}",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight(500),
                    ),
                  ),

                  SizedBox(height: 6),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text("MARKA:".toUpperCase()),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text("${product.brand}".toUpperCase()),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text("KATEGORİ".toUpperCase()),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(
                              "${product.category}".toUpperCase(),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text("FİYAT".toUpperCase()),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(
                              "${product.price}\$",
                              style: TextStyle(
                                color: const Color(0xFF0E26AF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  Consumer<CartModel>(
                    builder: (context, cardModel, child) {
                      return ElevatedButton(
                        onPressed: () {
                          cardModel.cardAdd(product);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Ürün sepete eklendi"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                              margin: EdgeInsets.only(
                                bottom: 20,
                                left: 25,
                                right: 25,
                              ),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF000000),
                          minimumSize: Size.fromHeight(50),
                        ),

                        child: Text(
                          "Sepete Ekle",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

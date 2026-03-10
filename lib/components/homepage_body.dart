import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:stajproje/cart_model/cart_model.dart';
import 'package:stajproje/models/product_model.dart';

class HomepageBody extends StatelessWidget {
  final Products product;

  const HomepageBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x9DFFFFFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product.id ?? 0,

              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network("${product.thumbnail}"),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "${product.category}".toUpperCase(),
                  style: TextStyle(fontSize: 12),
                ),

                Text(
                  "${product.title}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                Text(
                  "${product.brand ?? ""}".toUpperCase(),
                  style: TextStyle(fontSize: 12),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "${product.price}\$",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color(0xFF0E26AF),
                      ),
                    ),

                    Consumer<CartModel>(
                      builder: (context, cardModel, child) {
                        return IconButton(
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
                          icon: Icon(
                            Icons.add,
                            color: const Color(0xFF0E26AF),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

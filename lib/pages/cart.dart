import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stajproje/cart_model/cart_model.dart';
import 'package:stajproje/models/product_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int dismissableKey = 0;

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

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("SEPET"),
          ),

          body: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: Consumer<CartModel>(
                    builder: (context, cardProducts, child) {
                      List<Products> cardProductsData = cardProducts
                          .returnCard();
                      return ListView.builder(
                        itemCount: cardProductsData.length,

                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: ObjectKey(dismissableKey++),
                            direction: DismissDirection.endToStart,

                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              color: Colors.red,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),

                            movementDuration: Duration(seconds: 2),

                            onDismissed: (direction) {
                              Provider.of<CartModel>(
                                context,
                                listen: false,
                              ).cardRemove(cardProductsData[index]);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Ürün sepetten çıkartıldı",
                                  ),
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

                            child: Card(
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "${cardProductsData[index].thumbnail}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text(
                                            "${cardProductsData[index].title}",
                                            style: TextStyle(fontSize: 14),
                                            maxLines: 2,
                                            overflow:
                                                TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            "${cardProductsData[index].price}\$",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(
                                                0xFF0E26AF,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 20),

                Consumer<CartModel>(
                  builder: (context, cardProducts, child) {
                    return ElevatedButton(
                      onPressed: () {
                        cardProducts.cardProductsRemove();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Sipariş verildi. Sepet boşaltıldı",
                            ),
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
                        "SATIN AL",
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
    );
  }
}

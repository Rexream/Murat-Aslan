import 'package:flutter/material.dart';
import 'package:stajproje/api_service/fetch_data.dart';
import 'package:stajproje/components/appbar.dart';

import 'package:stajproje/components/homepage_body.dart';
import 'package:stajproje/models/product_model.dart';
import 'package:stajproje/pages/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<Products> allProducts = [];
  ApiService apiService = ApiService();
  TextEditingController urunArama = TextEditingController();

  @override
  void initState() {
    getData();

    super.initState();
  }

  Future<void> getData() async {
    try {
      ProductModel productData = await apiService.fetchData();

      setState(() {
        allProducts = productData.products ?? [];
        isLoading = false;
      });
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> getSearchedData(String querry) async {
    try {
      ProductModel productData = await apiService.fetchSearchedData(
        querry,
      );

      setState(() {
        allProducts = productData.products ?? [];
        isLoading = false;
      });
    } catch (e) {
      Exception(e);
    }
  }

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

          body: isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Yükleniyor",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xBDFFFFFF),
                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: TextField(
                            controller: urunArama,

                            onSubmitted: (value) {
                              setState(() {
                                isLoading = true;
                              });

                              getSearchedData(value);
                            },

                            decoration: InputDecoration(
                              hintText: "Ürün araması yap...",
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              border: InputBorder.none,

                              hintStyle: TextStyle(
                                color: const Color(0xFF3D3B3B),
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  getSearchedData(urunArama.text);
                                },

                                icon: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Color(0xFF3D3B3B),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: GridView.builder(
                          itemCount: allProducts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.6,
                              ),

                          itemBuilder: (context, index) {
                            final product = allProducts[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetail(product: product),
                                  ),
                                );
                              },
                              child: HomepageBody(product: product),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

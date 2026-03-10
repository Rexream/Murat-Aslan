class ProductModel {
  List<Products>? products;

  ProductModel({this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
}

class Products {
  int? id;
  String? title;
  String? brand;
  String? description;
  String? category;
  double? price;
  List<String>? images;
  String? thumbnail;

  Products({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.brand,
    this.images,
    this.thumbnail,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    brand = json['brand'];
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }
}

class Reviews {
  String? comment;
  String? date;
  String? reviewerName;

  Reviews({this.comment, this.date, this.reviewerName});

  Reviews.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['comment'] = comment;
    data['date'] = date;
    data['reviewerName'] = reviewerName;
    return data;
  }
}

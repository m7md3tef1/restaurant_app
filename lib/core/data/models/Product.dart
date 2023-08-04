import 'dart:ui';

class Product {
  var  id;
  var  name;
  var price;
  var Size;
  var imgurl;
  var Description;
  var type;
  var counter ;
  var category;
  Product(
      {this.type,
      this.counter,
      this.name,
      this.price,
      this.id,
        this.category,
      this.Description,
      this.imgurl,
      this.Size});

  Product.fromJson(dynamic json){
    id = json['id'];
    name = json['title'];
    price = json['price'];
    Description = json['description'];
    category = json['category'];
    imgurl = json['image'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = name;
    map['price'] = price;
    map['description'] = Description;
    map['category'] = category;
    map['image'] = imgurl;

    return map;
  }
}

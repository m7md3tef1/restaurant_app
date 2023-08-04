class CreatePro {
  CreatePro({
      this.title, 
      this.price, 
      this.description, 
      this.categoryId, 
      this.images,});

  CreatePro.fromJson(dynamic json) {
    title = json['title'];
    price = json['price'];
    description = json['description'];
    categoryId = json['categoryId'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  String? title;
  int? price;
  String? description;
  int? categoryId;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['categoryId'] = categoryId;
    map['images'] = images;
    return map;
  }

}
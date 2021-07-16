class ProductCategoriesResponseModel {
  List<ProductCategory> data;
  String message;
  int status;

  ProductCategoriesResponseModel({this.data, this.message, this.status});

  ProductCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ProductCategory>();
      json['data'].forEach((v) {
        data.add(new ProductCategory.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class ProductCategory {
  int id;
  String title;
  String img;
  int marketPlaceId;
  String createdAt;
  String updatedAt;

  ProductCategory(
      {this.id,
        this.title,
        this.img,
        this.marketPlaceId,
        this.createdAt,
        this.updatedAt});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    marketPlaceId = json['market_place_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img'] = this.img;
    data['market_place_id'] = this.marketPlaceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
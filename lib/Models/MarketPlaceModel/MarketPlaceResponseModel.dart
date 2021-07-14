class MarketPlaceResponseModel {
  List<MarketPlaceData> marketPlaceData;
  String message;
  int status;

  MarketPlaceResponseModel({this.marketPlaceData, this.message, this.status});

  MarketPlaceResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      marketPlaceData = new List<MarketPlaceData>();
      json['data'].forEach((v) {
        marketPlaceData.add(new MarketPlaceData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marketPlaceData != null) {
      data['data'] = this.marketPlaceData.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class MarketPlaceData {
  int id;
  String title;
  String img;
  String createdAt;
  String updatedAt;

  MarketPlaceData({this.id, this.title, this.img, this.createdAt, this.updatedAt});

  MarketPlaceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
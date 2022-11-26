class CreateUserResponse {
  bool? success;
  String? message;
  Data? data;

  CreateUserResponse({this.success, this.message, this.data});

  CreateUserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? name;
  int? age;
  String? location;
  Null? imageUrl;
  String? sId;
  int? iV;

  Data(
      {this.username,
        this.name,
        this.age,
        this.location,
        this.imageUrl,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    age = json['age'];
    location = json['location'];
    imageUrl = json['image_url'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['name'] = this.name;
    data['age'] = this.age;
    data['location'] = this.location;
    data['image_url'] = this.imageUrl;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

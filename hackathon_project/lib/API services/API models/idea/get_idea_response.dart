class IdeaResponse {
  bool? success;
  String? message;
  List<Data>? data;

  IdeaResponse({this.success, this.message, this.data});

  IdeaResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? username;
  String? userImage;
  String? title;
  String? description;
  int? iV;

  Data(
      {this.sId,
        this.username,
        this.userImage,
        this.title,
        this.description,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    userImage = json['user_image'];
    title = json['title'];
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['user_image'] = this.userImage;
    data['title'] = this.title;
    data['description'] = this.description;
    data['__v'] = this.iV;
    return data;
  }
}

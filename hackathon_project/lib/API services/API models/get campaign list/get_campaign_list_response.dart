class GetCampaignListResponse {
  bool? success;
  String? message;
  List<Data>? data;

  GetCampaignListResponse({this.success, this.message, this.data});

  GetCampaignListResponse.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? description;
  int? startTime;
  String? image;
  List<String>? followers;
  int? iV;

  Data(
      {this.sId,
        this.title,
        this.description,
        this.startTime,
        this.image,
        this.followers,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    startTime = json['start_time'];
    image = json['image'];
    followers = json['followers'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['start_time'] = this.startTime;
    data['image'] = this.image;
    data['followers'] = this.followers;
    data['__v'] = this.iV;
    return data;
  }
}

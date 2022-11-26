class GetProfileResponse {
  bool? success;
  String? message;
  Data? data;

  GetProfileResponse({this.success, this.message, this.data});

  GetProfileResponse.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? username;
  String? name;
  int? age;
  String? location;
  Null? imageUrl;
  List<ParticipatedCampaign>? participatedCampaign;
  int? iV;

  Data(
      {this.sId,
        this.username,
        this.name,
        this.age,
        this.location,
        this.imageUrl,
        this.participatedCampaign,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    name = json['name'];
    age = json['age'];
    location = json['location'];
    imageUrl = json['image_url'];
    if (json['participated_campaign'] != null) {
      participatedCampaign = <ParticipatedCampaign>[];
      json['participated_campaign'].forEach((v) {
        participatedCampaign!.add(new ParticipatedCampaign.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['name'] = this.name;
    data['age'] = this.age;
    data['location'] = this.location;
    data['image_url'] = this.imageUrl;
    if (this.participatedCampaign != null) {
      data['participated_campaign'] =
          this.participatedCampaign!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class ParticipatedCampaign {
  String? sId;
  String? title;
  String? description;
  int? startTime;
  String? image;
  String? location;
  List<String>? followers;
  int? iV;

  ParticipatedCampaign(
      {this.sId,
        this.title,
        this.description,
        this.startTime,
        this.image,
        this.location,
        this.followers,
        this.iV});

  ParticipatedCampaign.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    startTime = json['start_time'];
    image = json['image'];
    location = json['location'];
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
    data['location'] = this.location;
    data['followers'] = this.followers;
    data['__v'] = this.iV;
    return data;
  }
}

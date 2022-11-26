class CreateIdeaResponse {
  bool? success;
  String? message;
  NewIdea? newIdea;

  CreateIdeaResponse({this.success, this.message, this.newIdea});

  CreateIdeaResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    newIdea = json['new_idea'] != null
        ? new NewIdea.fromJson(json['new_idea'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.newIdea != null) {
      data['new_idea'] = this.newIdea!.toJson();
    }
    return data;
  }
}

class NewIdea {
  String? username;
  String? userImage;
  String? title;
  String? description;
  String? sId;
  int? iV;

  NewIdea(
      {this.username,
        this.userImage,
        this.title,
        this.description,
        this.sId,
        this.iV});

  NewIdea.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userImage = json['user_image'];
    title = json['title'];
    description = json['description'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['user_image'] = this.userImage;
    data['title'] = this.title;
    data['description'] = this.description;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class CreateIdeaRequest {
  String? username;
  String? userImage;
  String? title;
  String? description;

  CreateIdeaRequest(this.username, this.userImage, this.title, this.description);

  CreateIdeaRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userImage = json['user_image'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['user_image'] = this.userImage;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}

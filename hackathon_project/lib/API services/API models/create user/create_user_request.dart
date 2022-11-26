class CreateUserRequest {
  String? username;
  String? name;
  int? age;
  String? location;
  String? imageUrl;

  CreateUserRequest(this.username, this.name, this.age, this.location, this.imageUrl);

  CreateUserRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    age = json['age'];
    location = json['location'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['name'] = this.name;
    data['age'] = this.age;
    data['location'] = this.location;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class RegisterResponse {
  bool? success;
  String? message;
  NewAccount? newAccount;

  RegisterResponse({this.success, this.message, this.newAccount});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    newAccount = json['new_account'] != null
        ? new NewAccount.fromJson(json['new_account'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.newAccount != null) {
      data['new_account'] = this.newAccount!.toJson();
    }
    return data;
  }
}

class NewAccount {
  String? username;
  String? password;
  String? sId;
  int? iV;

  NewAccount({this.username, this.password, this.sId, this.iV});

  NewAccount.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

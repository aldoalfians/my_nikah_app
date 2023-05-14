class User {
  String? uuid;
  String? name;
  String? email;
  String? role;

  User({this.uuid, this.name, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}

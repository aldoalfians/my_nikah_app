class UserLogin {
  String? uuid;
  String? name;
  String? nik;
  String? email;
  String? role;

  UserLogin({this.uuid, this.name, this.nik, this.email, this.role});

  UserLogin.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    nik = json['nik'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['nik'] = this.nik;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}

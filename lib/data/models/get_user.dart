class GetUser {
  GetUser({
    required this.uuid,
    required this.name,
    required this.email,
    required this.role,
  });
  late final String uuid;
  late final String name;
  late final String email;
  late final String role;

  GetUser.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['name'] = name;
    _data['email'] = email;
    _data['role'] = role;
    return _data;
  }
}

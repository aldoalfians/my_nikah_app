class BookingDetail {
  String? uuid;
  String? hours;
  String? date;
  int? price;
  String? role;
  String? status;
  User? user;

  BookingDetail(
      {this.uuid,
      this.hours,
      this.date,
      this.price,
      this.role,
      this.status,
      this.user});

  BookingDetail.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    hours = json['hours'];
    date = json['date'];
    price = json['price'];
    role = json['role'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['hours'] = this.hours;
    data['date'] = this.date;
    data['price'] = this.price;
    data['role'] = this.role;
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;

  User({this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}

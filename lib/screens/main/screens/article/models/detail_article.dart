class DetailArticle {
  String? uuid;
  String? title;
  String? content;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  DetailArticle(
      {this.uuid,
      this.title,
      this.content,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  DetailArticle.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    content = json['content'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['imageUrl'] = this.imageUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

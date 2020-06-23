class Post {
  String id;
  String idUser;
  String title;
  String photo;
  String date;
  String description;
  String status;

  Post(
      {this.id,
      this.idUser,
      this.title,
      this.photo,
      this.date,
      this.description,
      this.status});

  Post.fromMap(Map map, String id)
      : id = id ?? '',
        idUser = map['idUser'] ?? '',
        title = map['title'] ?? '',
        photo = map['photo'] ?? '',
        date = map["date"] ?? '',
        description = map["description"] ?? '',
        status = map['status'] ?? '';

  toJson() {
    return {
      "idUser": idUser,
      "title": title,
      "photo": photo,
      "date": date,
      "description": description,
      "status": status,
    };
  }
}

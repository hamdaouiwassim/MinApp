class Post {
  String id;
  String idUser;
  String title;
  String photo;
  String date;
  double longitude;
  double latitude;

  Post(
      {this.id,
      this.idUser,
      this.title,
      this.photo,
      this.date,
      this.longitude,
      this.latitude});
  Post.fromMap(Map map, String id)
      : id = id ?? '',
        idUser = map['idUser'] ?? '',
        title = map['title'] ?? '',
        photo = map['photo'] ?? '',
        date = map["date"] ?? '',
        longitude = map['longitude'] ?? 0.0,
        latitude = map['latitude'] ?? 0.0;
  toJson() {
    return {
      "idUser": idUser,
      "title": title,
      "photo": photo,
      "date": date,
      "longitude": longitude,
      "latitude": latitude
    };
  }
}

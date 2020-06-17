class User {
  String uid;
  String email;
  String name;
  String photoUrl;

  User({this.uid, this.email, this.name, this.photoUrl});

  factory User.fromMap(Map data) {
    return User(
      uid: data['uid'],
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {"uid": uid, "email": email, "name": name, "photoUrl": photoUrl};
}

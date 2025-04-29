import 'dart:convert';

class User {
  final String id;
  final String fullname;
  final String email;
  final String state;
  final String locality;
  final String password;
  final String token;

  User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.state,
    required this.locality,
    required this.password,
    required this.token,
  });

//serialization: Convert user object to a map
//A map is a collection of key value pair
//Convert to a map is an intermediate step that makes it to serialize to the obbject like json format
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "fullname": fullname,
      "email": email,
      "state": state,
      "locality": locality,
      "password": password,
      "token": token
    };
  }

  //Serialisation : Convert Map to a json string
  String toJson() => json.encode(toMap());

  //Deserialize: convert a map to a user object
  //the factory constructor take a Map(usually obtained from a json object)
  //and converts it into a User Object

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String? ?? "",
      fullname: map['fullname'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
      token: map['token'] as String? ?? "",
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

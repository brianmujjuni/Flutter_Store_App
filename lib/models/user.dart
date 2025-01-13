class User {

  final String id;
  final String fullname;
  final String email;
  final String state;
  final String locality;
  final String password;

  User({required this.id, required this.fullname, required this.email, required this.state, required this.locality, required this.password});
  
//serialization: Convert user object to a map 
//A map is a collection of key value pair
//Convert to a map is an intermediate step that makes it to serialize to the obbject like json format
Map<String,dynamic> toMap(){
  return <String, dynamic>{
    "id": id,
    "fullname": fullname,
    "email": email,
    "state": state,
    "locality": locality,
    "password": password
  };
}
}
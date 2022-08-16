class userModel{
  int id; 
  String username;
  String email;
  String password;
  String description;
  String country;
  String image_url;
  DateTime created_at;
  DateTime updated_at;
   
  userMap(){
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['username'] = username;
    mapping['email'] = email;
    mapping['password'] = password;
    mapping['description'] = description;
    mapping['country'] = country;
    mapping['image_url'] = image_url;
    mapping['created_at'] = created_at;
    mapping['updated_at'] = updated_at;
   
    return mapping;
  }
}
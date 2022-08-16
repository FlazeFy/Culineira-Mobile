class commentModel{
  int id; 
  int recipe_id;
  int steps_id;
  int users_id; 
  String username;
  String comment_body; 
  String comment_image; 
  String image_url; 
  DateTime created_at;
  DateTime updated_at;
   
  commentMap(){
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['recipe_id'] = recipe_id;
    mapping['steps_id'] = steps_id;
    mapping['users_id'] = users_id;
    mapping['username'] = username;
    mapping['comment_body'] = comment_body;
    mapping['comment_image'] = comment_image;
    mapping['image_url'] = image_url;
    mapping['created_at'] = created_at;
    mapping['updated_at'] = updated_at;
    
    return mapping;
  }
}
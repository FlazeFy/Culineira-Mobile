class recipeModel{
  int id; 
  int user_id; 
  String recipe_name; 
  String username; 
  int recipe_calorie; 
  String recipe_desc; 
  String recipe_country; 
  String recipe_type; 
  int recipe_time_spend; 
  String recipe_main_ing; 
  String recipe_level; 
  String recipe_visibility; 
  String recipe_url; 
  String recipe_video;
  String user_image; 
  DateTime created_at; 
  DateTime updated_at;
   
  recipeMap(){
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['user_id'] = user_id;
    mapping['recipe_name'] = recipe_name;
    mapping['username'] = username;
    mapping['recipe_calorie'] = recipe_calorie;
    mapping['recipe_desc'] = recipe_desc;
    mapping['recipe_country'] = recipe_country;
    mapping['recipe_type'] = recipe_type;
    mapping['recipe_time_spend'] = recipe_time_spend;
    mapping['recipe_main_ing'] = recipe_main_ing;
    mapping['recipe_level'] = recipe_level;
    mapping['recipe_visibility'] = recipe_visibility;
    mapping['recipe_url'] = recipe_url;
    mapping['recipe_video'] = recipe_video;
    mapping['image_url'] = user_image;
    mapping['created_at'] = created_at;
    mapping['updated_at'] = updated_at;
    
    return mapping;
  }
}
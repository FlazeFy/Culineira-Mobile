class stepsModel{
  int id; 
  int recipe_id; 
  String steps_body; 
  String steps_type; 
  String steps_image; 
   
  stepsMap(){
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['recipe_id'] = recipe_id;
    mapping['steps_body'] = steps_body;
    mapping['steps_type'] = steps_type;
    mapping['steps_image'] = steps_image;
    
    return mapping;
  }
}
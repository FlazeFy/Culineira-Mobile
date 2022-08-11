class ingredientsModel{
  int id; 
  int recipe_id; 
  String ingredients_name; 
  String ingredients_type; 
  String ingredients_vol; 
   
  ingredientsMap(){
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['recipe_id'] = recipe_id;
    mapping['ingredients_name'] = ingredients_name;
    mapping['ingredients_vol'] = ingredients_vol;
    mapping['ingredients_type'] = ingredients_type;
    
    return mapping;
  }
}
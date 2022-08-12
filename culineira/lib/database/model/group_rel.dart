class groupRelModel{
  int id; 
  String groups_name; 
  String groups_description; 
  String groups_image; 
  DateTime created_at; 
  DateTime updated_at;
  String groups_type;
  int id_user; 
   
  groupRelMap(){
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['groups_name'] = groups_name;
    mapping['groups_description'] = groups_description;
    mapping['group_image'] = groups_image;
    mapping['created_at'] = created_at;
    mapping['updated_at'] = updated_at;
    mapping['groups_type'] = groups_type;
    mapping['id_user'] = id_user;
    
    return mapping;
  }
}
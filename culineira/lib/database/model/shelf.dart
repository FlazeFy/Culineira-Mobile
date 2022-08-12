class shelfModel{
  int id; 
  int users_id; 
  String item_name; 
  String item_description; 
  int item_qty; 
  DateTime created_at; 
  DateTime updated_at;
   
  shelfMap(){
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['users_id'] = users_id;
    mapping['item_name'] = item_name;
    mapping['item_description'] = item_description;
    mapping['item_qty'] = item_qty;
    mapping['created_at'] = created_at;
    mapping['updated_at'] = updated_at;
    
    return mapping;
  }
}
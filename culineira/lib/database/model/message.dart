class messageModel{
  int id; 
  String message_body; 
  String username;  
  DateTime created_at; 
  DateTime updated_at;
   
  messageMap(){
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['message_body'] = message_body;
    mapping['username'] = username;
    mapping['created_at'] = created_at;
    mapping['updated_at'] = updated_at;
    
    return mapping;
  }
}
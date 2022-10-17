class likesModel {
  int id;
  int users_id;
  int recipe_id;
  DateTime created_at;
  DateTime updated_at;

  likesMap() {
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['users_id'] = users_id;
    mapping['recipe_id'] = recipe_id;
    mapping['created_at'] = created_at;
    mapping['updated_at'] = updated_at;

    return mapping;
  }
}

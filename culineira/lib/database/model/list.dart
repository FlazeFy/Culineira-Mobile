class listModel {
  int id;
  int users_id;
  String list_name;
  String list_status;
  String list_description;
  DateTime created_at;
  DateTime updated_at;

  //For relationw w/ recipe.
  int list_recipe_rel;

  listMap() {
    var mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['users_id'] = users_id;
    mapping['list_name'] = list_name;
    mapping['iist_status'] = list_status;
    mapping['list_recipe_rel'] = list_recipe_rel;
    mapping['list_description'] = list_description;
    mapping['created_at'] = created_at;
    mapping['updated_at'] = updated_at;

    return mapping;
  }
}

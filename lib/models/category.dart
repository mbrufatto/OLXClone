import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_clone/repositories/table_keys.dart';

class Category {
  final id;
  final description;

  Category(this.id, this.description);

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        description = parseObject.get(keyCategoryDescription);

  @override
  String toString() {
    return 'Category{id: $id, description: $description}';
  }
}

/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 14. 12. 2023
///
import 'package:food_blueprint/src/types/ingredient_category.dart';

class CategoryNames {
  static final Map<String, String> pretty = Map.fromEntries(<String, String>{
    "meat": "maso",
    "salad": "salát",
    "cheese": "sýr",
    "sauce": "omáčka",
    "bun": "bulka"
  }.entries);

  static String prettyCategoryName(String categoryKey) {
    if (!pretty.keys.contains(categoryKey)) {
      throw ArgumentError.value(categoryKey, "Not configured.");
    }
    return pretty[categoryKey]!;
  }

  static List<IngredientCategory> categoryObjects(List<String> categories) {
    return categories.map((cat) {
      String pretty = prettyCategoryName(cat);

      return IngredientCategory(cat, pretty);
    }).toList();
  }
}

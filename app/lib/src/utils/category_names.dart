import 'package:food_blueprint/src/types/ingredient_category.dart';

class CategoryNames {
  static const List<String> categories = ["meat", "salad", "sauce", "bun"];

  static final Map<String, String> pretty = Map.fromEntries(<String, String>{
    "meat": "maso",
    "salad": "salát",
    "sauce": "omáčka",
    "bun": "houska"
  }.entries);

  static String prettyCategoryName(String categoryKey) {
    if (!categories.contains(categoryKey) ||
        !pretty.keys.contains(categoryKey)) {
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

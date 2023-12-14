import 'package:flutter/cupertino.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/types/ingredient_category.dart';

class IngredientTray extends StatefulWidget {
  final List<Ingredient> ingredients;
  final List<IngredientCategory> categories;

  const IngredientTray(
      {super.key, required this.ingredients, required this.categories});

  @override
  State<StatefulWidget> createState() => _IngredientTrayState();
}

class _IngredientTrayState extends State<IngredientTray> {
  String _selectedCategoryKey = "meat";

  void handleSelect(String categoryKey) {
    setState(() {
      _selectedCategoryKey = categoryKey;
      // todo: display different ingredients based on category
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 1,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
            itemBuilder: (context, int index) {
              IngredientCategory category = widget.categories[index];

              return GestureDetector(
                  onTap: () {
                    handleSelect(category.key);
                  },
                  child: Text(category.name,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          decoration: _selectedCategoryKey == category.key
                              ? TextDecoration.underline
                              : TextDecoration.none)));
            },
            itemCount: widget.categories.length,
          )),
      Expanded(flex: 5, child: Center(child: Text(_selectedCategoryKey)))
    ]);
  }
}

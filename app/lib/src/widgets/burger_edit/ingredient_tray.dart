import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/types/ingredient_category.dart';

class IngredientTray extends StatefulWidget {
  final List<Ingredient> availableIngredients;
  final List<IngredientCategory> categories;

  const IngredientTray(
      {super.key, required this.availableIngredients, required this.categories});

  @override
  State<StatefulWidget> createState() => _IngredientTrayState();
}

class _IngredientTrayState extends State<IngredientTray> {
  String _selectedCategoryKey = "meat";
  List<Ingredient> _displayedIngredients = [];

  List<Ingredient> getCurrentIngredients() {
    return widget.availableIngredients.where((e) {
      return e.category == _selectedCategoryKey;
    }).toList();
  }

  void handleSelect(String categoryKey) {
    setState(() {
      _selectedCategoryKey = categoryKey;
      _displayedIngredients = getCurrentIngredients();
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedCategoryKey = widget.categories[0].key;
    _displayedIngredients = getCurrentIngredients();
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
      Expanded(
          flex: 5,
          child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runAlignment: WrapAlignment.start,
                      spacing: 6,
                      runSpacing: 6,
                      children: _displayedIngredients.map((Ingredient ingr) {
                        return IngredientItem(ingredient: ingr);
                      }).toList()))))
    ]);
  }
}

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Draggable(
        data: ingredient,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: Container(
          width: 40,
          height: 40,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.cyan),
        ),
        child: Container(
            width: 40,
            height: 40,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.cyan),
            child: Center(child: Text(ingredient.name))));
  }
}

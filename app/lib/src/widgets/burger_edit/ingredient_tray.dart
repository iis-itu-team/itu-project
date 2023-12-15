import 'package:flutter/material.dart';
import 'package:food_blueprint/src/env/env.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/types/ingredient_category.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';

class IngredientTray extends StatefulWidget {
  final List<Ingredient> availableIngredients;
  final List<IngredientCategory> availableCategories;

  const IngredientTray(
      {super.key,
      required this.availableIngredients,
      required this.availableCategories});

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
    _selectedCategoryKey = widget.availableCategories[0].key;
    _displayedIngredients = getCurrentIngredients();
  }

  Widget _buildCategoryList(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) {
        return const SizedBox(width: 14);
      },
      itemBuilder: (context, int index) {
        IngredientCategory category = widget.availableCategories[index];

        return GestureDetector(
          onTap: () {
            handleSelect(category.key);
          },
          child: Text(category.name,
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Theme.of(context).textTheme.bodyMedium!.color!,
                        offset: const Offset(0, -2))
                  ],
                  fontSize: 20,
                  color: Colors.transparent,
                  fontWeight: FontWeight.w800,
                  decoration: _selectedCategoryKey == category.key
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationThickness: 3,
                  decorationColor:
                      Theme.of(context).textTheme.bodyMedium!.color!)),
        );
      },
      shrinkWrap: true,
      itemCount: widget.availableCategories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: _buildCategoryList(context)),
      const SizedBox(height: 4),
      Container(
        height: 4,
        color: ThemeColors.colorCheese,
      ),
      Expanded(
          flex: 8,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
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

  final String baseUrl = Environment().apiUrl;

  IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Draggable(
        data: ingredient,
        dragAnchorStrategy: (Draggable<Object> draggable, BuildContext context,
            Offset position) {
          return const Offset(80, 80);
        },
        feedback: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(ImageUrlLoader.getServedImageUrl(
                      ingredient.icon, "https://i.imgur.com/aZjDYBS.jpeg")))),
        ),
        child: Column(children: [
          SizedBox(
              height: 20,
              child: Text(ingredient.name,
                  style: const TextStyle(fontWeight: FontWeight.w800))),
          Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(ImageUrlLoader.getServedImageUrl(
                          ingredient.icon,
                          "https://i.imgur.com/aZjDYBS.jpeg"))))),
          SizedBox(
              height: 20,
              child: Text('${ingredient.price} Kč',
                  style: const TextStyle(fontWeight: FontWeight.w800))),
        ]));
  }
}

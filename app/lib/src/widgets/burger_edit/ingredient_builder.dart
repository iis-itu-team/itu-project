import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/ingredient.dart';

class IngredientBuilder extends StatefulWidget {
  final List<Ingredient> burgerIngredients;

  const IngredientBuilder({super.key, required this.burgerIngredients});

  @override
  State<StatefulWidget> createState() => _IngredientBuilderState();
}

class _IngredientBuilderState extends State<IngredientBuilder> {
  final int _totalPrice = 0;

  _IngredientBuilderState();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          Ingredient ingredient = widget.burgerIngredients[index];
          return SizedBox(
              width: 500,
              child: Row(children: [
                Expanded(
                    flex: 5,
                    child: Container(
                        color: Colors.amber,
                        width: 200,
                        height: 50,
                        child: Center(child: Text(ingredient.name)))),
                Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text("${ingredient.price}"))))
              ]));
        },
        itemCount: widget.burgerIngredients.length);
  }
}

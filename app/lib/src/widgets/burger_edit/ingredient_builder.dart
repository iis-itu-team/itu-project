import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/models/ingredient_in_food.dart';

class IngredientBuilder extends StatefulWidget {
  final List<IngredientInFood> burgerIngredients;

  const IngredientBuilder({super.key, required this.burgerIngredients});

  @override
  State<StatefulWidget> createState() => _IngredientBuilderState();
}

class _IngredientBuilderState extends State<IngredientBuilder> {
  int _totalPrice = 0;

  _IngredientBuilderState();

  @override
  void initState() {
    super.initState();
    _totalPrice = widget.burgerIngredients.isNotEmpty
        ? widget.burgerIngredients
            .map((ingredient) => ingredient.price)
            .reduce((value, element) => (value + element))
        : 0;
  }

  void _addBurgerIngredient(Ingredient ingredient, int index) {
    setState(() {
      widget.burgerIngredients.insert(index, IngredientInFood.fromIngredient(ingredient, index));
      _totalPrice += ingredient.price;
      developer.log("Added ingredient ${ingredient.name} at index $index");
    });
  }

  void _removeIngredient(IngredientInFood ingredient, int index) {
    setState(() {
      widget.burgerIngredients.removeAt(index);
      _totalPrice -= ingredient.price;
      developer.log("Removed ingredient ${ingredient.name}");
    });
  }

  Widget _buildIngredientList(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 420),
          child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (context, index) {
                return DragTarget<Ingredient>(onAccept: (ingredient) {
                  _addBurgerIngredient(ingredient, index + 1);
                }, builder: (context, candidateItems, rejectedItems) {
                  if (candidateItems.isNotEmpty) {
                    return Container(
                        height: 16,
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(color: Colors.red))));
                  } else {
                    return const SizedBox(height: 16);
                  }
                });
              },
              itemBuilder: (context, index) {
                IngredientInFood ingredient = widget.burgerIngredients[index];
                return SizedBox(
                    width: MediaQuery.of(context).size.width - 16,
                    child: Row(children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              padding: const EdgeInsets.all(6),
                              child: GestureDetector(
                                  onTap: () {
                                    _removeIngredient(ingredient, index);
                                  },
                                  child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.red)),
                                      child: const Center(
                                          child: Text("x",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight:
                                                      FontWeight.bold))))))),
                      Expanded(
                          flex: 5,
                          child: Container(
                              color: Colors.amber,
                              width: 200,
                              height: 50,
                              child: Center(
                                  child: Text("${ingredient.name} ($index)")))),
                      Expanded(
                          flex: 1,
                          child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text("${ingredient.price}"))))
                    ]));
              },
              itemCount: widget.burgerIngredients.length),
        ));
  }

  Widget _buildDropZone(BuildContext context, double height, int index) {
    return DragTarget<Ingredient>(
        builder: (context, candidateItems, rejectedItems) {
      if (candidateItems.isNotEmpty) {
        return Container(
            height: height,
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.red))));
      } else {
        return Container(height: height);
      }
    }, onAccept: (ingredient) {
      _addBurgerIngredient(ingredient, index);
    });
  }

  // empty -> add two buns, buns cannot be deleted
  // <2 ingredients -> drop zone highlighted in the middle
  // >2 -> drop zones between ingredients (only)

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildDropZone(context, 64, 0),
      Expanded(child: _buildIngredientList(context)),
      _buildDropZone(context, 64, widget.burgerIngredients.length),
      Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 32),
          child: Text(_totalPrice.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              )))
    ]);
  }
}

/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 14. 12. 2023
///
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/models/ingredient_in_food.dart';
import 'package:food_blueprint/src/theme/theme.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';

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
      widget.burgerIngredients
          .insert(index, IngredientInFood.fromIngredient(ingredient, index));
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

  Widget _buildIngredientLayerIcon(
      BuildContext context, IngredientInFood ingredient, int index, int len) {
    String? icon = ingredient.icon;

    // force top bun
    if (index == 0 && ingredient.category == "bun") {
      icon = "/icons/ingredients/top_bun.png";
    }

    // force bottom bun
    if (index == len - 1 && ingredient.category == "bun") {
      icon = "/icons/ingredients/bottom_bun.png";
    }

    Widget layerIcon = Image.network(ImageUrlLoader.getServedImageUrl(
        icon, "https://i.imgur.com/aZjDYBS.jpeg"));

    bool draggable = index != 0 && index != len - 1;

    return draggable
        ? LongPressDraggable(
            data: Ingredient.fromInFood(ingredient),
            delay: const Duration(milliseconds: 150),
            dragAnchorStrategy: (Draggable<Object> draggable,
                BuildContext context, Offset position) {
              return const Offset(100, 25);
            },
            onDragStarted: () {
              _removeIngredient(ingredient, index);
            },
            feedback: SizedBox(width: 200, height: 50, child: layerIcon),
            child: layerIcon)
        : layerIcon;
  }

  Widget _buildIngredientLayer(BuildContext context, int index) {
    IngredientInFood ingredient = widget.burgerIngredients[index];

    // non-removable top and bottom bun
    bool removable = index != widget.burgerIngredients.length - 1 && index != 0;

    return SizedBox(
        width: MediaQuery.of(context).size.width - 16,
        child: Row(children: [
          Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.all(6),
                  child: GestureDetector(
                      onTap: () {
                        _removeIngredient(ingredient, index);
                      },
                      child: (() => removable
                          ? const Center(
                              child: Text("x",
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.red)))
                          : Container())()))),
          Expanded(
              flex: 8,
              child: _buildIngredientLayerIcon(
                  context, ingredient, index, widget.burgerIngredients.length)),
          Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text("${ingredient.price} Kč",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)))))
        ]));
  }

  List<Widget> _buildIngredients(BuildContext context) {
    // build ingredients in the list as a column
    List<Widget> children = [];

    for (int index = 0; index < widget.burgerIngredients.length; index++) {
      children.add(_buildIngredientLayer(context, index));

      if (widget.burgerIngredients.length == 2) {
        // only two buns, add a giant drop zone in the middle
        if (index == 0) {
          children.add(_buildDropZone(context, 128, index, true, false));
        }
      } else {
        if (index != widget.burgerIngredients.length - 1) {
          children.add(_buildDropZone(context, 16, index, false, true));
        }
      }
    }

    return children;
  }

  Widget _buildIngredientList(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(children: _buildIngredients(context)))));
  }

  Widget _buildDropZoneIndicator(BuildContext context, int index, double height,
      bool visibleWhenEmpty, bool highlighted) {
    return Container(
        key: ValueKey("ingredient-layer-$index-$highlighted"),
        height: height,
        padding: EdgeInsets.symmetric(vertical: height / 8),
        child: Container(
            width: 300,
            decoration: visibleWhenEmpty || highlighted
                ? BoxDecoration(
                    color: Colors.green.withOpacity(highlighted ? 0.5 : 0.1),
                    border: Border.all(color: Colors.greenAccent),
                    borderRadius: const BorderRadius.all(Radius.circular(8)))
                : const BoxDecoration(),
            child: Visibility(
                visible: highlighted || visibleWhenEmpty,
                child: Center(
                    child: Text("+",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: (height * 1.2) % 32,
                            fontWeight: FontWeight.bold))))));
  }

  Widget _buildDropZone(BuildContext context, double height, int index,
      bool visibleWhenEmpty, bool expand) {
    return DragTarget<Ingredient>(
        builder: (context, candidateItems, rejectedItems) {
      return AnimatedSwitcher(
          reverseDuration: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 100),
          child: AnimatedSize(
              duration: const Duration(milliseconds: 100),
              curve: Curves.fastOutSlowIn,
              child: _buildDropZoneIndicator(
                  context,
                  index,
                  candidateItems.isEmpty || !expand ? height : height * 2,
                  visibleWhenEmpty,
                  candidateItems.isNotEmpty)));
    }, onAccept: (ingredient) {
      _addBurgerIngredient(ingredient, index + 1);
    });
  }

  // empty -> add two buns, buns cannot be deleted
  // <2 ingredients -> drop zone highlighted in the middle
  // >2 -> drop zones between ingredients (only)

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: _buildIngredientList(context)),
      Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          child: Text('$_totalPrice Kč',
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Theme.of(context).textTheme.bodyMedium!.color!,
                        offset: const Offset(0, 6))
                  ],
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.overline,
                  decorationColor: ThemeColors.colorCheese,
                  decorationThickness: 4,
                  fontSize: 16,
                  color: Colors.transparent))),
    ]);
  }
}

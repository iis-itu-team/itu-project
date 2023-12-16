import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_page.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';
import 'package:food_blueprint/src/widgets/common/image_with_fallback.dart';

class BurgerListing extends StatefulWidget {
  final List<Burger> burgers;

  const BurgerListing({super.key, required this.burgers});

  @override
  State<StatefulWidget> createState() => _BurgerListingState();
}

class _BurgerListingState extends State<BurgerListing> {
  Widget _buildBurgerItem(BuildContext context, Burger burger) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            BurgerEditPage.routeName,
            arguments: BurgerEditArguments(burger),
          );
        },
        child: SizedBox(
            width: 100,
            height: 120,
            child: Column(children: [
              Text(burger.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w800)),
              Expanded(
                  child: ImageWithFallback(
                      key: ValueKey(burger.hashCode),
                      icon: burger.icon,
                      width: 80,
                      height: 80,
                      fallback: ImageUrlLoader.prefixUrl('/icons/burger.png'))),
              Text('${burger.price} Kč', textAlign: TextAlign.end)
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        const SizedBox(
          width: 20,
        ),
        const Text("moje burgříky",
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Container(
                height: 4,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ))),
        const SizedBox(
          width: 20,
        ),
      ]),
      const SizedBox(
        height: 20,
      ),
      Wrap(
          spacing: 0,
          runSpacing: 0,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: widget.burgers
              .map((burger) => _buildBurgerItem(context, burger))
              .toList())
    ]);
  }
}

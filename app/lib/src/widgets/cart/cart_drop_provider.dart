import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_blueprint/src/events/cart_item_dropped.dart';
import 'package:food_blueprint/src/events/cart_item_removed.dart';
import 'package:food_blueprint/src/types/cart.dart';
import 'package:food_blueprint/src/utils/event_handler.dart';

class CartDropProvider extends StatefulWidget {
  final LayerLink layerLink;
  final Widget child;

  const CartDropProvider(
      {super.key, required this.layerLink, required this.child});

  @override
  State<StatefulWidget> createState() => _CartDropProviderState();
}

class _CartDropProviderState extends State<CartDropProvider> {
  OverlayEntry? _overlayEntry;

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: widget.layerLink,
        child: DragTarget<CartBurger>(onWillAccept: (item) {
          return false;
        }, builder: (context, candidateItems, rejectedItems) {
          if (rejectedItems.isNotEmpty) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              if (_overlayEntry == null) {
                _overlayEntry = OverlayEntry(builder: (context) {
                  return Positioned(
                      top: 0,
                      left: 0,
                      child: CompositedTransformFollower(
                          link: widget.layerLink,
                          offset: Offset(MediaQuery.of(context).size.width / 6,
                              MediaQuery.of(context).size.height / 3),
                          child: DragTarget<CartBurger>(onAccept: (item) {
                            EventHandler.fire(CartItemRemoved(item));

                            _removeOverlay();
                          }, builder: (context, candidateItems, rejectedItems) {
                            return Container(
                                width:
                                    MediaQuery.of(context).size.width * 4 / 6,
                                height: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red.withOpacity(
                                        candidateItems.isEmpty ? 0.1 : 0.4)),
                                child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                      const Text("Zahodit",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 16,
                                          )),
                                      SvgPicture.asset(
                                          "assets/images/Trash.svg",
                                          width: 80,
                                          height: 80),
                                    ])));
                          })));
                });
                Overlay.of(context).insert(_overlayEntry!);

                EventHandler.listen<CartItemDropped>((event) {
                  _removeOverlay();
                });
              }
            });
          }

          return widget.child;
        }));
  }
}

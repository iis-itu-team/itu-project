import 'package:flutter/material.dart';
import 'package:food_blueprint/src/models/order.dart';

import 'dart:developer' as developer;

import 'package:food_blueprint/src/pages/order_new/order_new_controller.dart';

typedef OnDelete = Function();

class OrderForm extends StatefulWidget {
  final Order order;
  final state = _OrderFormState();
  late final OnDelete onDelete;

  OrderForm({super.key, required this.order, required this.onDelete});
  @override
  _OrderFormState createState() => state;

  bool isValid() => state.validate();
}

class _OrderFormState extends State<OrderForm> {
  late final OrderNewController controller;
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.order.street,
                onSaved: (val) => widget.order.street = val,
                validator: (val) => val!.isNotEmpty ? null : "Nesprávny údaj",
                decoration: const InputDecoration(
                  labelText: "Ulica",
                ),
              ),
              TextFormField(
                initialValue: widget.order.city,
                onSaved: (val) => widget.order.city = val,
                validator: (val) => val!.isNotEmpty ? null : "Nesprávny údaj",
                decoration: const InputDecoration(
                  labelText: "Mesto",
                ),
              ),
              OutlinedButton(
                onPressed: widget.onDelete,
                child: null,
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) {
      form.currentState?.save();
    }

    developer.log("save");
    developer.log(widget.order.toString());
    return valid;
  }
}

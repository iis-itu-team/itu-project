import "dart:developer" as developer;

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/services/keeper_service.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ensure keeper id
  final KeeperService service = KeeperService();
  String id = await service.getKeeperId();

  developer.log("KeeperID: $id");

  runApp(MyApp());
}

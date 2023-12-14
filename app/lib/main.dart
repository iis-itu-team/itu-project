import "dart:developer" as developer;

import 'package:flutter/material.dart';
import 'package:food_blueprint/src/services/keeper_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/app.dart';

Future main() async {
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();

  // ensure keeper id
  final KeeperService service = KeeperService();
  String id = await service.ensureKeeperId();

  developer.log("KeeperID: $id");

  runApp(MyApp());
}

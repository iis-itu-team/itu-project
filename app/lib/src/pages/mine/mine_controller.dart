/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/utils/keeper_store.dart';

class MineController {
  final BurgerService burgerService;

  const MineController(this.burgerService);

  Future<List<Burger>> listBurgers() async {
    GetBurgersInput input =
        GetBurgersInput.from(await KeeperStore.getKeeperId(), null);
    final result =
        await burgerService.listBurgers(input).catchError((error, stack) {
      return HttpResult(600, "fail", List<Burger>.from([]));
    });

    if (result.status != "success") {
      throw "Failed to list burgers.";
    }

    return result.data!;
  }
}

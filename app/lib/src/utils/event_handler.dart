/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'dart:async';

import 'package:event_bus/event_bus.dart';

class EventHandler {
  static final EventBus eventBus = EventBus();

  static listen<T>(void Function(T event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return eventBus.on<T>().listen(
        onDone: onDone, onData, onError: onError, cancelOnError: cancelOnError);
  }

  static fire(event) {
    eventBus.fire(event);
  }

  static cancelAll(Iterable<StreamSubscription> subs) {
    for (var element in subs) {
      element.cancel();
    }
  }
}

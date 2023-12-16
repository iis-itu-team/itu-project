import 'package:event_bus/event_bus.dart';

class EventHandler {
  static final EventBus eventBus = EventBus();

  static listen<T>(void Function(T event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    eventBus.on<T>().listen(
        onDone: onDone, onData, onError: onError, cancelOnError: cancelOnError);
  }

  static fire(event) {
    eventBus.fire(event);
  }
}

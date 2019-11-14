import 'package:mobx/mobx.dart';

part 'event_detail_controller.g.dart';

class EventDetailController = _EventDetailBase with _$EventDetailController;

abstract class _EventDetailBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

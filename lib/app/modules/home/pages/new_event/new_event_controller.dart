import 'package:mobx/mobx.dart';

//part 'newevent_controller.g.dart';

//class NewEventController = _NewEventBase with _$NewEventController;

abstract class _NewEventBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

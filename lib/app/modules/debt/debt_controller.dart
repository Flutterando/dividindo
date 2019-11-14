import 'package:dividindo/app/modules/debt/repositories/debt_repository.dart';
import 'package:dividindo/app/shared/models/user_debts_model.dart';
import 'package:mobx/mobx.dart';

part 'debt_controller.g.dart';

class DebtController = _DebtBase with _$DebtController;

abstract class _DebtBase with Store {
  final DebtRepository debtRepository;

  @observable
  ObservableStream<List<UserDebtsModel>> userDebtsObservable;

  _DebtBase(this.debtRepository) {
    userDebtsObservable = ObservableStream(debtRepository.getDebtSubscription());   
  }
}

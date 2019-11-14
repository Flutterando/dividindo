// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DebtController on _DebtBase, Store {
  final _$userDebtsObservableAtom = Atom(name: '_DebtBase.userDebtsObservable');

  @override
  ObservableStream<List<UserDebtsModel>> get userDebtsObservable {
    _$userDebtsObservableAtom.context
        .enforceReadPolicy(_$userDebtsObservableAtom);
    _$userDebtsObservableAtom.reportObserved();
    return super.userDebtsObservable;
  }

  @override
  set userDebtsObservable(ObservableStream<List<UserDebtsModel>> value) {
    _$userDebtsObservableAtom.context.conditionallyRunInAction(() {
      super.userDebtsObservable = value;
      _$userDebtsObservableAtom.reportChanged();
    }, _$userDebtsObservableAtom,
        name: '${_$userDebtsObservableAtom.name}_set');
  }
}

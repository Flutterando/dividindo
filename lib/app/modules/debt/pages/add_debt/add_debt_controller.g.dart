// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_debt_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddDebtController on _AddDebtBase, Store {
  final _$isLoadindAtom = Atom(name: '_AddDebtBase.isLoadind');

  @override
  bool get isLoadind {
    _$isLoadindAtom.context.enforceReadPolicy(_$isLoadindAtom);
    _$isLoadindAtom.reportObserved();
    return super.isLoadind;
  }

  @override
  set isLoadind(bool value) {
    _$isLoadindAtom.context.conditionallyRunInAction(() {
      super.isLoadind = value;
      _$isLoadindAtom.reportChanged();
    }, _$isLoadindAtom, name: '${_$isLoadindAtom.name}_set');
  }

  final _$eventUserErrorAtom = Atom(name: '_AddDebtBase.eventUserError');

  @override
  String get eventUserError {
    _$eventUserErrorAtom.context.enforceReadPolicy(_$eventUserErrorAtom);
    _$eventUserErrorAtom.reportObserved();
    return super.eventUserError;
  }

  @override
  set eventUserError(String value) {
    _$eventUserErrorAtom.context.conditionallyRunInAction(() {
      super.eventUserError = value;
      _$eventUserErrorAtom.reportChanged();
    }, _$eventUserErrorAtom, name: '${_$eventUserErrorAtom.name}_set');
  }

  final _$getEventUserAsyncAction = AsyncAction('getEventUser');

  @override
  Future<List<EventModelUserDto>> getEventUser(String filter) {
    return _$getEventUserAsyncAction.run(() => super.getEventUser(filter));
  }

  final _$saveAsyncAction = AsyncAction('save');

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }
}

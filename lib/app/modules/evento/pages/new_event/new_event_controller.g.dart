// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_event_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewEventController on _NewEventBase, Store {
  final _$nameErrroAtom = Atom(name: '_NewEventBase.nameErrro');

  @override
  String get nameErrro {
    _$nameErrroAtom.context.enforceReadPolicy(_$nameErrroAtom);
    _$nameErrroAtom.reportObserved();
    return super.nameErrro;
  }

  @override
  set nameErrro(String value) {
    _$nameErrroAtom.context.conditionallyRunInAction(() {
      super.nameErrro = value;
      _$nameErrroAtom.reportChanged();
    }, _$nameErrroAtom, name: '${_$nameErrroAtom.name}_set');
  }

  final _$isLoadindAtom = Atom(name: '_NewEventBase.isLoadind');

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

  final _$saveAsyncAction = AsyncAction('save');

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }
}

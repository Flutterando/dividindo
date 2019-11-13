// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  final _$emailErrorAtom = Atom(name: '_LoginBase.emailError');

  @override
  String get emailError {
    _$emailErrorAtom.context.enforceReadPolicy(_$emailErrorAtom);
    _$emailErrorAtom.reportObserved();
    return super.emailError;
  }

  @override
  set emailError(String value) {
    _$emailErrorAtom.context.conditionallyRunInAction(() {
      super.emailError = value;
      _$emailErrorAtom.reportChanged();
    }, _$emailErrorAtom, name: '${_$emailErrorAtom.name}_set');
  }

  final _$passworErrorAtom = Atom(name: '_LoginBase.passworError');

  @override
  String get passworError {
    _$passworErrorAtom.context.enforceReadPolicy(_$passworErrorAtom);
    _$passworErrorAtom.reportObserved();
    return super.passworError;
  }

  @override
  set passworError(String value) {
    _$passworErrorAtom.context.conditionallyRunInAction(() {
      super.passworError = value;
      _$passworErrorAtom.reportChanged();
    }, _$passworErrorAtom, name: '${_$passworErrorAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }
}

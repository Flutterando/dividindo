// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventoController on _EventoBase, Store {
  final _$eventosAtom = Atom(name: '_EventoBase.eventos');

  @override
  List<EventModel> get eventos {
    _$eventosAtom.context.enforceReadPolicy(_$eventosAtom);
    _$eventosAtom.reportObserved();
    return super.eventos;
  }

  @override
  set eventos(List<EventModel> value) {
    _$eventosAtom.context.conditionallyRunInAction(() {
      super.eventos = value;
      _$eventosAtom.reportChanged();
    }, _$eventosAtom, name: '${_$eventosAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_EventoBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$_EventoBaseActionController = ActionController(name: '_EventoBase');

  @override
  void refresh() {
    final _$actionInfo = _$_EventoBaseActionController.startAction();
    try {
      return super.refresh();
    } finally {
      _$_EventoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(dynamic eventId) {
    final _$actionInfo = _$_EventoBaseActionController.startAction();
    try {
      return super.remove(eventId);
    } finally {
      _$_EventoBaseActionController.endAction(_$actionInfo);
    }
  }
}

import 'package:dividindo/app/modules/home/pages/new_event/new_event_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dividindo/app/modules/home/pages/new_event/new_event_page.dart';

class NewEventModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
      //  Bloc((i) => NewEventController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => NewEventPage();

  static Inject get to => Inject<NewEventModule>.of();
}
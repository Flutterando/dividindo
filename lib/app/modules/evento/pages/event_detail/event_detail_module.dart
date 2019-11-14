import 'package:dividindo/app/modules/evento/pages/event_detail/event_detail_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dividindo/app/modules/evento/pages/event_detail/event_detail_page.dart';

class EventDetailModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => EventDetailController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => EventDetailPage();

  static Inject get to => Inject<EventDetailModule>.of();
}

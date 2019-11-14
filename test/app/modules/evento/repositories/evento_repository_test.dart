import 'package:flutter_test/flutter_test.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:dividindo/app/modules/evento/repositories/evento_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  EventoRepository repository;
  MockClient client;

  setUp(() {
    repository = EventoRepository(HasuraConnect("https://flutterando-dividindo.herokuapp.com/v1/graphql"));
    client = MockClient();
  });
 
}

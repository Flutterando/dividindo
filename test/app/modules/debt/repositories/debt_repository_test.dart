import 'package:dividindo/app/shared/models/event_user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:dividindo/app/modules/debt/repositories/debt_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  DebtRepository repository;
  MockClient client;

  setUp(() {
    repository = DebtRepository(HasuraConnect("https://flutterando-dividindo.herokuapp.com/v1/graphql"));
    client = MockClient();
  });

   group('EventoRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<DebtRepository>());
    });

     test("First Test 02", () async {
      expect(await repository.getEventUser("d7466160-0d86-4268-8ba1-12917ef54db0", "7f02ffd9-5de5-4535-89e7-65ca45866792"), isInstanceOf<EventUserModel>());
    });

  });

}

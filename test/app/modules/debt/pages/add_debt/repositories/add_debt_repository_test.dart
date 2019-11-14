import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:dividindo/app/modules/debt/pages/add_debt/repositories/add_debt_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  AddDebtRepository repository;
  MockClient client;

  setUp(() {
    repository = AddDebtRepository(null);
    client = MockClient();
  });

  group('AddDebtRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<AddDebtRepository>());
    });
    
  });
}

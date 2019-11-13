import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:dividindo/app/modules/home/pages/new_event/repositories/new_event_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  NewEventRepository repository;
  MockClient client;

  setUp(() {
    repository = NewEventRepository();
    client = MockClient();
  });

  group('NewEventRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<NewEventRepository>());
    });

    test('returns a Post if the http call completes successfully', () async {
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
              (_) async => Response(data: {'title': 'Test'}, statusCode: 200));
      Map<String, dynamic> data = await repository.fetchPost(client);
      expect(data['title'], 'Test');
    });
  });
}

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dividindo/app/shared/models/event_model.dart';
import 'package:dividindo/app/shared/models/event_user_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class EventoRepository extends Disposable {
  final HasuraConnect hasuraConnect;

  EventoRepository(this.hasuraConnect);
  Future<List<EventModel>> getEvents() async {
    var query = '''query events {
                          events {
                            id
                            name
                            user {
                              id
                              name
                            }
                            created_at
                          }
                        }
                        ''';
    try {
      var response = await hasuraConnect.query(query);

      return EventModel.fromJsonList(response['data']['events'] as List);
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[getEvents]');
      print(e);
      print(e.extensions);
      print('=================');
      return null;
    }
  }

  Future<bool> deleteEvent(String eventId, String userId) async {
    var query = '''mutation deleteEvents(\$eventId:uuid!,\$userId:uuid!){
                    delete_events(where: {id: {_eq: \$eventId}, id_user: {_eq: \$userId}}) {
                      affected_rows
                    }
                  }''';
    try {
      await hasuraConnect.mutation(
        query,
        variables: {
          'eventId': eventId,
          'userId': userId,
        },
      );

      return true;
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[deleteEvent]');
      print(e);
      print(e.extensions);
      print('=================');
      return false;
    }
  }

  

  //dispose will be called automatically
  @override
  void dispose() {}
}

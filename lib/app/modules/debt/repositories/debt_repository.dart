import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dividindo/app/shared/models/event_user_model.dart';
import 'package:dividindo/app/shared/models/user_debts_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class DebtRepository extends Disposable {
 
  final HasuraConnect hasuraConnect;

  DebtRepository(this.hasuraConnect);

  Stream<List<UserDebtsModel>> getDebtSubscription() {
    var query = '''subscription subscription {
                    user_debts{
                      id
                      id_event_user
                      name
                      paid_out
                      value
                    }
                  }''';

    try {
       Snapshot snapshot = hasuraConnect.subscription(query);

       return snapshot.stream.map(
        (json) => UserDebtsModel.fromJsonList(json['data']['user_debts']  as List),
      );
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[getDebts]');
      print(e);
      print(e.extensions);
      print('=================');
      return null;
    }
  }

  Future<EventUserModel> getEventUser(String eventId, String userId) async {
    var query = '''query event_user(\$eventId: uuid!, \$userId: uuid!) {
                        event_user(where: {id_event: {_eq: \$eventId}, _and: {id_user: {_eq: \$userId}}}) {
                          id
                          id_user
                          id_event
                        }
                      }''';
    try {
      var data = await hasuraConnect.query(
        query,
        variables: {
          'eventId': eventId,
          'userId': userId,
        },
      );

      return EventUserModel.fromJson(data['data']['event_user'][0]);
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[getEvents]');
      print(e);
      print(e.extensions);
      print('=================');
      return null;
    }
  }
  //dispose will be called automatically
  @override
  void dispose() {}
}

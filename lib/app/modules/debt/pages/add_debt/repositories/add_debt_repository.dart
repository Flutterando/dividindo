import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dividindo/app/shared/models/event_model_user_dto.dart';
import 'package:dividindo/app/shared/models/user_debts_model.dart';
import 'package:dividindo/app/shared/models/user_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AddDebtRepository extends Disposable {
  final HasuraConnect hasuraConnect;

  AddDebtRepository(this.hasuraConnect);

  Future<List<EventModelUserDto>> getEventUser(String filter, String userId) async {
    var query = '''query event_user(\$filter: String!, \$userId: uuid!) {
                    event_user(where: {_and: {id_user: {_eq: \$userId}}, event: {name: {_like: \$filter}}}) {
                      id
                      event {
                        name
                        id
                      }
                    }
                  }
                  ''';
    try {
      var response = await hasuraConnect.query(
        query,
        variables: {
          'filter': "%$filter%",
          'userId': userId,
        },
      );

      return EventModelUserDto.fromJsonList(response['data']['event_user'] as List);

    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[getEvents]');
      print(e);
      print(e.extensions);
      print('=================');
      return [];
    }
  }

 Future<UserDebtsModel> createUserDebts(UserDebtsModel user) async {
    var query =
        '''mutation insert_user_debts(\$id_event_user: uuid!, \$name: String!,\$paid_out:Boolean!, \$value: Float!) {
              insert_user_debts(objects: {id_event_user: \$id_event_user, name: \$name, paid_out: \$paid_out, value: \$value}) {
                returning {
                  id
                  id_event_user
                  name
                  paid_out
                  value
                  created_at
                }
              }
            }
            ''';

    try {

      var data = await hasuraConnect.mutation(query, variables: {
        'id_event_user': user.idEventUser,
        'name': user.name,
        'paid_out': user.paidOut,
        'value': user.value
      });

      user.id = data['data']['insert_user_debts']['returning'][0]['id'];
      user.createdAt = data['data']['insert_user_debts']['returning'][0]['created_at'];
      return user;
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[createUserDebts]');
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

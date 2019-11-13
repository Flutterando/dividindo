import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';

class NewEventRepository extends Disposable {
  final HasuraConnect hasuraConnect;

  NewEventRepository(this.hasuraConnect);

  Future addNewEvent(String name, String userId) async {
    var query = '''mutation insert_event(\$name:String!, \$userId:uuid!) {
                  insert_events(objects: {name: \$name, id_user: \$userId}) {
                    returning {
                      id      
                    }
                  }
                }
                ''';

    try {
      var data = await hasuraConnect.mutation(query, variables: {
        'name': name,
        'userId': userId,
      });

      return data['data']['insert_events']['returning'][0]['id'];
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[createUser]');
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

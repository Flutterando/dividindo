import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dividindo/app/shared/models/user_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class LoginRepository extends Disposable {
  final HasuraConnect hasuraConnect;

  LoginRepository(this.hasuraConnect);

  @override
  void dispose() {}

  Future<UserModel> efetuarLogin(String email, String password) async {
    try {
      var response = await hasuraConnect.query(
          '''query signin(\$email:String!, \$password:String!){
                            users(where:{_and:[{email: {_eq: \$email}}, {password: {_eq: \$password}}]}) {
                              id,
                              email,
                              name,
                              created_at
                            }
                          }''',
          variables: {"email": email, "password": password});

      return UserModel.fromJson(response["data"]["users"][0]);

    } catch (e) {
      rethrow;
    }
  }
}

//https://flutterando-dividindo.herokuapp.com/v1/graphql

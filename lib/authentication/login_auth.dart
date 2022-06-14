




import '../config/api.dart';

Future attemptLogIn(String username, String password) async {
return await ApiHandler().post('/api/token', {username:username, password:password});
  }

  
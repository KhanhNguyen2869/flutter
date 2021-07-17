import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String username, String password) async {
  String url = "https://comesis-be.herokuapp.com/api/users/login";
  final response = await http.post(Uri.parse(url),
  headers:{"Accept":"Applicationm/json"},
  body: {"username" : username, "password" : password}
  );
  var converDatatoJson = jsonDecode(response.body);
  return converDatatoJson;
}
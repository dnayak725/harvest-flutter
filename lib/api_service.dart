import 'dart:convert';


import 'package:havest/Model/LoginModel.dart';
import 'package:http/http.dart' as http;

// login api
class LoginApiService {
  Future<LoginResponse> login(Map<String, dynamic> param) async {
    String url = "https://helobnv2.quocent.com/api/user/login";

    final response = await http.post(Uri.parse(url),
        headers: {"API-KEY": "AIzaSyDcwzB-olAQNHSPh8FazQjYlTm6G40PwJQ"},
        body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(data);
    } else {
      return LoginResponse.fromError(data);
    }
  }
}

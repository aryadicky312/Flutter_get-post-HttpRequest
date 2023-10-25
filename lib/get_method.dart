import 'dart:convert';
import 'package:http/http.dart' as http;

class GetMethod {
  String id;
  String name;

  GetMethod({
    required this.id,
    required this.name,
  });

  factory GetMethod.createGetMethod(Map<String, dynamic> object){
    return GetMethod(id: object['id'].toString(), name: object['first_name'] + " " + object['last_name']
    );
  }

  static Future<GetMethod> connectToAPI(String id) async{
    String apiURL = "https://reqres.in/api/users/$id";

    var apiMethod = await http.get(
      Uri.parse(apiURL),
    );

    var jsonObject = json.decode(apiMethod.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return GetMethod.createGetMethod(userData);
  }
}
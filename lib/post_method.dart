import 'dart:convert';

import 'package:http/http.dart' as http;

class PostMethod {
  String kode;
  String nama;
  String pekerjaan;
  String tanggal;

  PostMethod({
    required this.kode,
    required this.nama,
    required this.pekerjaan,
    required this.tanggal,
  });

  factory PostMethod.createPostMethod(Map<String, dynamic> object){
    return PostMethod(kode: object['id'].toString(), nama: object['name'], pekerjaan: object['job'], tanggal: object['createdAt']);
  }

  static Future<PostMethod> connectToAPI(String name, String job) async{
    String apiURL = "https://reqres.in/api/users";

    var apiMethod = await http.post(
      Uri.parse(apiURL),
      body: {
        "name" : name,
        "job" : job,
      },
    );

    var jsonObject = json.decode(apiMethod.body);

    return PostMethod.createPostMethod(jsonObject);
  }
}
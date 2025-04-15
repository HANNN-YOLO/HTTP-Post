import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStatefull {
  String id, name, job, createdAt;

  HttpStatefull({
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  });

  static Future<HttpStatefull> Connectfull(String name, String job) async {
    var url = Uri.parse("https://reqres.in/api/users");
    // Uri url = Uri.parse("https://reqres.in/api/users");

    var responstatefull = await http.post(
      url,
      body: {"name": name, "job": job},
    );

    var data = json.decode(responstatefull.body);

    return HttpStatefull(
      id: data["id"],
      name: data["name"],
      job: data["job"],
      createdAt: data["createdAt"],
    );
  }
}

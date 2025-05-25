import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStatefull {
  int id;
  String name, job, createdAt;

  HttpStatefull({
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  });

  static Future<HttpStatefull> Connectfull(String name, String job) async {
    var url = Uri.parse("https://reqres.in/api/users");

    var responstatefull = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
      body: jsonEncode({"name": name, "job": job}),
    );

    if (responstatefull.statusCode == 201) {
      print('Succes: ${responstatefull.body}');
    } else {
      print('Error : ${responstatefull.body}');
    }

    // http.post(url, body: {"name": name, "job": job});

    var data = json.decode(responstatefull.body);
    print("RESPONSE BODY: $data");

    return HttpStatefull(
      id: int.parse(data['id'].toString()) ?? 0,
      name: name,
      job: job,
      createdAt: data["createdAt"] ?? "",
    );
  }
}

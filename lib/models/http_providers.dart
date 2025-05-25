import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get alldata => _data.length;

  Future<void> sambungapi(String name, String job) async {
    var url = Uri.parse("https://reqres.in/api/users");

    var hasilakhir = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'reqres-free-v1',
      },
      body: jsonEncode({"name": name, "job": job}),
    );

    if (hasilakhir.statusCode == 201) {
      print("Berhasil : ${hasilakhir.body}");
    } else {
      print("Kesalahan: ${hasilakhir.body}");
    }

    _data = json.decode(hasilakhir.body);
    print("Respon : $data");
    notifyListeners();
  }
}

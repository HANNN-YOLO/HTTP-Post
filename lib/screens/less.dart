import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/http_providers.dart';

class Less extends StatelessWidget {
  static const nameroute = "/less";
  @override
  Widget build(BuildContext context) {
    final mydata = Provider.of<HttpProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/736x/e8/75/ea/e875ea005a35f7d393ce3aa23f510129.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        title: Text("Post Provider", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              alignment: Alignment.center,
              child: Consumer<HttpProvider>(
                builder:
                    (context, value, child) => Text(
                      (value.data["id"] == null)
                          ? "ID : BELUM ADA DATA"
                          : "ID : ${value.data["id"]}",
                      style: TextStyle(fontSize: 20),
                    ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Consumer<HttpProvider>(
                builder:
                    (context, value, child) => Text(
                      (value.data["name"] == null)
                          ? "NAMA : BELUM ADA DATA"
                          : "NAMA : ${value.data["name"]}",
                      style: TextStyle(fontSize: 20),
                    ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder:
                    (context, value, child) => Text(
                      (value.data["job"] == null)
                          ? "JOB : TIDAK ADA DATA"
                          : "JOB : ${value.data["job"]}",
                      style: TextStyle(fontSize: 20),
                    ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Consumer<HttpProvider>(
                builder:
                    (context, value, child) => Text(
                      (value.data["createdAt"] == null)
                          ? "CREATED AT : TIDAK ADA DATA"
                          : "CREATED AT : ${value.data["createdAt"]}",
                      style: TextStyle(fontSize: 20),
                    ),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              onPressed: () {
                mydata.sambungAPI("HANNN", "Enjoy");
              },
              child: Text(
                "POST DATA",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

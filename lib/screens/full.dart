import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/http_statefull.dart';

class Full extends StatefulWidget {
  static const nameroute = "/full";
  @override
  State<Full> createState() => _LessState();
}

class _LessState extends State<Full> {
  HttpStatefull? data;

  @override
  Widget build(BuildContext context) {
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
                "https://i.pinimg.com/474x/dc/02/92/dc0292ac49d03a9d585e87c2c20981be.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        title: Text("Post Statefull", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              alignment: Alignment.center,
              child: Text(
                (data?.id == null) ? "ID : BELUM ADA DATA" : "ID : ${data!.id}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                (data?.name == null)
                    ? "NAMA : BELUM ADA DATA"
                    : "NAMA : ${data!.name}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                (data?.job == null)
                    ? "JOB : TIDAK ADA DATA"
                    : "JOB: ${data!.job}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                (data?.createdAt == null)
                    ? "CREATED AT : TIDAK ADA DATA"
                    : "CREATE AT: ${data!.createdAt}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              onPressed: () {
                HttpStatefull.Connectfull("Manusia", "Solo Player ").then((
                  value,
                ) {
                  print(value.id);
                  setState(() {
                    data = value;
                  });
                });
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

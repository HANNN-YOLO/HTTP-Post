// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/http_providers.dart';
import 'package:provider/provider.dart';
import './screens/less.dart';
import './screens/full.dart';

void main() {
  runApp(Postapp());
}

class Postapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HttpProvider())],
      // Versi Stateless <Provider>
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Less(),
        // Full(),
        routes: {
          Less.nameroute: (ctx) => Less(),
          Full.nameroute: (ctx) => Full(),
        },
      ),

      // Versi Statefull
      // child: MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   home: Full(),
      //   routes: {
      //     Less.nameroute: (ctx) => Less(),
      //     Full.nameroute: (ctx) => Full(),
      //   },
      // ),
    );
  }
}

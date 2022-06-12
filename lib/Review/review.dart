// Harusnya ini Review Produk, yang main tolong cari Template :D

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'motogp_model.dart';

Future<List<Data>> fetchReview() async {
  String url = "http://motogpmerch.herokuapp.com/review-produk/json/";
  http.Response response = await http.get(Uri.parse(url));
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Data> review = [];
  for (var d in data) {
    print(d);
    if (d != null) {
      review.add(Data.fromJson(d));
    }
  }
  return review;
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Data>> futureReview;

  @override
  void initState() {
    super.initState();
    futureReview = fetchReview();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review Merchandise',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Review Merchandise'),
        ),
        body: FutureBuilder<List<Data>>(
          future: futureReview,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 179, 172, 41),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data![index].fields.nama,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const SizedBox(height: 10),
                      // Image("Gambar: " +
                      //     (snapshot.data![index].fields.gambar == true
                      //         ? NetworkImage(gambar)
                      //         : "Tidak dapat menampilkan gambar")),
                      // Text("Review: " + snapshot.data![index].fields.review),
                      // Image("Rating: " +
                      //     (snapshot.data![index].fields.rating == true
                      //         ? NetworkImage(rating)
                      //         : "Tidak dapat menampilkan gambar")),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

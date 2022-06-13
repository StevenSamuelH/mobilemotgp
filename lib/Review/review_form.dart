import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'review.dart';

Future<http.Response> updateReview(
    String nama, String gambar, String review, String rating) {
  return http.post(
    Uri.parse('https://motogpmerch.herokuapp.com/review-produk/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nama': nama,
      'gambar': gambar,
      'review': review,
      'rating': rating,
    }),
  );
}

class FormReview extends StatefulWidget {
  const FormReview({Key? key}) : super(key: key);

  @override
  _FormReviewState createState() => _FormReviewState();
}

class _FormReviewState extends State<FormReview> {
  String _namaProduk = '';
  String _gambarProduk = '';
  String _reviewProduk = '';
  String _ratingProduk = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildnamaProduk() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'Nama Produk'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _namaProduk = value!;
        });
  }

  Widget _buildgambarProduk() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'URL Image Produk'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _gambarProduk = value!;
        });
  }

  Widget _buildreviewProduk() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'Review Produk'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _reviewProduk = value!;
        });
  }

  Widget _buildratingProduk() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'URL Image Rating Produk'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _ratingProduk = value!;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Review'),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Review Produk",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  height: 1.6,
                  fontFamily: 'Open Sans',
                  fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildnamaProduk(),
                  _buildgambarProduk(),
                  _buildreviewProduk(),
                  _buildratingProduk(),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Submit',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();

                      updateReview(_namaProduk, _gambarProduk, _reviewProduk,
                              _ratingProduk)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyAppa()));
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ])));
  }
}

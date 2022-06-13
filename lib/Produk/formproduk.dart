import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'homeproduk.dart';

Future<http.Response> updateProduk(
    String name, String price, String deskripsiProduk, String image) {
  return http.post(
    Uri.parse(
        'https://motogpmerch.herokuapp.com/apiproduk/add-produk/data-api'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'namaProduk': name,
      'priceProduk': price,
      'DeskripsiProduk': deskripsiProduk,
      'image': image,
    }),
  );
}

class FormArtikel extends StatefulWidget {
  const FormArtikel({Key? key}) : super(key: key);

  @override
  _FormArtikelState createState() => _FormArtikelState();
}

class _FormArtikelState extends State<FormArtikel> {
  String _nameProduk = '';
  String _priceProduk = '';
  String _deskripsiProduk = '';
  String _imageProduk = '';

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
          _nameProduk = value!;
        });
  }

  Widget _buildhargaProduk() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'Price Produk'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _priceProduk = value!;
        });
  }

  Widget _buildBagianTitle1() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'Deskripsi Produk'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _deskripsiProduk = value!;
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
          _imageProduk = value!;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Produk'),
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
              "MOTOGPMERCH FORM",
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
                  _buildhargaProduk(),
                  _buildBagianTitle1(),
                  _buildgambarProduk(),
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

                      updateProduk(_nameProduk, _priceProduk, _deskripsiProduk,
                              _imageProduk)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Awalan()));
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

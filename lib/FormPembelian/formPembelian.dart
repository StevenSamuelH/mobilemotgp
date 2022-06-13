import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:mobilemotogp/main.dart';

Future<http.Response> updateDataPembeli(String nama, String alamat, String kota,
    String kecamatan, String kodePos, String buktiPembayaran) {
  return http.post(
    // Masih harus diganti
    Uri.parse(
        'https://motogpmerch.herokuapp.com/apiproduk/add-produk/data-api'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nama': nama,
      'alamat': alamat,
      'kota': kota,
      'kecamatan': kecamatan,
      'kodePos': kodePos,
      'buktiImg': buktiPembayaran,
    }),
  );
}

class FormPembelian extends StatefulWidget {
  const FormPembelian({Key? key}) : super(key: key);

  @override
  _FormPembelianState createState() => _FormPembelianState();
}

class _FormPembelianState extends State<FormPembelian> {
  String _namaPembeli = '';
  String _alamatPembeli = '';
  String _kotaPembeli = '';
  String _kecamatanPembeli = '';
  String _kodePosPembeli = '';
  String _buktiPembayaran = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Pembayaran"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "contoh: Bintang",
                      labelText: "Nama Lengkap",
                      // icon: const Icon(Icons.people),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama Lengkap tidak boleh kosong";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _namaPembeli = value!;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: false, // Untuk membuat text menjadi invisible
                    decoration: InputDecoration(
                      hintText: "contoh: Jalan Kebon Jeruk Raya",
                      labelText: "Alamat",
                      // icon: const Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _alamatPembeli = value!;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: false, // Untuk membuat text menjadi invisible
                    decoration: InputDecoration(
                      hintText: "contoh: Jakarta Barat",
                      labelText: "Kota",
                      // icon: const Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kota tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _kotaPembeli = value!;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: false, // Untuk membuat text menjadi invisible
                    decoration: InputDecoration(
                      hintText: "contoh: Kecamatan Kebon Jeruk",
                      labelText: "Kecamatan",
                      // icon: const Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kecamatan tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _kecamatanPembeli = value!;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: false, // Untuk membuat text menjadi invisible
                    decoration: InputDecoration(
                      hintText: "contoh: 11480",
                      labelText: "Kode Pos",
                      // icon: const Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kode Pos tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _buktiPembayaran = value!;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: false, // Untuk membuat text menjadi invisible
                    decoration: InputDecoration(
                      hintText:
                          "contoh: s4.bukalapak.com/img/9002/large/data.jpeg",
                      labelText: "Link Bukti Pembayaran",
                      // icon: const Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Link Bukti Pembayaran tidak boleh kosong';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _kodePosPembeli = value!;
                    },
                  ),
                ),

                // ignore: deprecated_member_use
                ElevatedButton(
                  child: const Text(
                    'Submit',
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();

                    updateDataPembeli(
                            _namaPembeli,
                            _alamatPembeli,
                            _kotaPembeli,
                            _kecamatanPembeli,
                            _kodePosPembeli,
                            _buktiPembayaran)
                        .then((value) {});
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MyApp()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

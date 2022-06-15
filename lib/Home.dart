import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _preco = "0";

  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });

    print(_preco);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("imagens/bitcoin.png"),
              Padding(padding: EdgeInsets.only(top: 40, bottom: 40), child: Text("R\$" + _preco, style: TextStyle(fontSize: 35))),
              ElevatedButton(
                child: Text("Atualizar", style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: _recuperarPreco,
              )
            ],
          ))),
    );
  }
}

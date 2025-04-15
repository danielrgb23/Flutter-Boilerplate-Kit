import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  static const String PATH = '/';

  const Teste({ Key? key }) : super(key: key);

  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('BATATA'),),
    );
  }
}
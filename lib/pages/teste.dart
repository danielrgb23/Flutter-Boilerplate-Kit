import 'package:flutter/material.dart';
import 'package:config_flutter/common/mixins/l10n_mixin.dart';

class Teste extends StatefulWidget {
  static const String PATH = '/';

  const Teste({ Key? key }) : super(key: key);

  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> with L10n {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(l10n.testeText),),
    );
  }
}
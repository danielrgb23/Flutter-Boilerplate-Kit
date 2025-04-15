import 'package:flutter/material.dart';
import 'package:config_flutter/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //ESPAÇO PARA CONFIGIRAR ESTADOS INICIAIS
  //TRATAR ERROS DE INICIALIZAÇÂO
  //TRATAR CERTIFICADOS DA LOJA
  
   runApp(FlutterConfigApp());
}
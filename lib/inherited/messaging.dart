import 'package:flutter/material.dart';


class Messaging extends StatefulWidget {
  final Widget? child;

  const Messaging({super.key, this.child});

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  // AQUI VOCE PODE UTILIZAR CHAMADA DE FUNÇÕES DE NOTIFICAÇÔES
  // API DE BANCOS< CONFIGURAÇÕES BASE E ETC
}
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:config_flutter/pages/teste.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:config_flutter/inherited/messaging.dart';
import 'package:config_flutter/utils/navigator_service.dart';
class FlutterConfigApp extends StatelessWidget {
  const FlutterConfigApp({super.key});

  Widget _app() {
    return GetMaterialApp(
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Ocorreu um error',
                style: const TextStyle(color: Color(0xFF9CA0A6), fontSize: 20),
              ),
            ),
          );
        };

        final botFunc = BotToastInit();

        return botFunc(context, widget);
      },
      navigatorKey: NavigatorService.key,
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {

        return "Flutter Config Basics";
      },

      routes: {
        Teste.PATH: (context) => Teste()
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Messaging(
      child: _app(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:config_flutter/pages/teste.dart';
import 'package:config_flutter/inherited/messaging.dart';
import 'package:config_flutter/l10n/app_localizations.dart';
import 'package:config_flutter/utils/navigator_service.dart';
import 'package:config_flutter/common/mixins/l10n_mixin.dart';

class FlutterConfigApp extends StatelessWidget with L10n {
  const FlutterConfigApp({super.key});

  Widget _app() {
    return MaterialApp(
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Ocorreu um erro',
                style: const TextStyle(color: Color(0xFF9CA0A6), fontSize: 20),
              ),
            ),
          );
        };
        L10n.init(context);
        return widget!;
      },
      navigatorKey: NavigatorService.key,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        final l10n = AppLocalizations.of(context)!;
        return l10n.flutterConfigApp;
      },
      initialRoute: Teste.PATH,
      routes: {
        Teste.PATH: (context) => Teste(),
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

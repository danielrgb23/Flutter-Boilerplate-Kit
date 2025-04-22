import 'package:flutter/material.dart';
import 'package:config_flutter/l10n/app_localizations.dart';
import 'package:config_flutter/l10n/app_localizations_pt.dart';


mixin L10n {
  static late AppLocalizations? _l10n;

  AppLocalizations get l10n => L10n._l10n ?? AppLocalizationsPt();

  static void init(BuildContext context) =>
      _l10n = AppLocalizations.of(context) ?? AppLocalizationsPt();
}
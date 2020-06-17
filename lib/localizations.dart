import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';
part 'localizations.g.dart';

@SheetLocalization("1Kx6VvXchntvASRqefD5RJ1p-fj0III4PDR-kKxls2Mo", "0",
    4) // <- See 1. to get DOCID and SHEETID
// the `1` is the generated version. You must increment it each time you want to regenerate
// a new version of the labels.
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.languages.containsKey(locale);
  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

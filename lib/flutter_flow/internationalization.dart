import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'ccu7kv5o': {
      'es': 'Municipalidad de La Florida',
      'en': '',
    },
    '0yvl2bel': {
      'es': 'Entregas',
      'en': '',
    },
    'ox3g73en': {
      'es': 'Ingrese los siguientes datos para ingresar a nuestra app.',
      'en': '',
    },
    'kp88xl67': {
      'es': 'Email',
      'en': '',
    },
    'w3i51p0l': {
      'es': 'Password',
      'en': '',
    },
    'l95r4pc1': {
      'es': 'Ingresarlo',
      'en': '',
    },
    'ej9wg18r': {
      'es': 'Home',
      'en': '',
    },
  },
  // firmaResponsable
  {
    '8o4946v1': {
      'es': 'Limpiar firma',
      'en': '',
    },
    'e36d8kvq': {
      'es': 'Guardar',
      'en': '',
    },
    '25cx9o32': {
      'es': 'Firma Responsable municipalidad',
      'en': '',
    },
    'xzh1056o': {
      'es': 'Home',
      'en': '',
    },
  },
  // lecturaCedulaVecino
  {
    'djjmn3y8': {
      'es': 'Cancel',
      'en': '',
    },
    'zdbyyng9': {
      'es': 'QR Rut',
      'en': '',
    },
    'rtichm7k': {
      'es': 'Cancel',
      'en': '',
    },
    'z2i8tg5n': {
      'es': 'Lectura QR cedula beneficiario',
      'en': '',
    },
  },
  // firmaVecino
  {
    '1adr8nob': {
      'es': 'Limpiar firma',
      'en': '',
    },
    'fvg7f56r': {
      'es': 'Guardar',
      'en': '',
    },
    'dud6p0c5': {
      'es': 'Firma Vecino (Recibe conforme)',
      'en': '',
    },
    '8da4429x': {
      'es': 'Home',
      'en': '',
    },
  },
  // direccionVecino
  {
    'gjimq0ht': {
      'es': 'Selecciona la dirección',
      'en': '',
    },
    '83o7ieau': {
      'es': 'Dirección seleccionada',
      'en': '',
    },
    'uprj9okx': {
      'es': 'Confirmar dirección',
      'en': '',
    },
    'sfl6dowu': {
      'es': 'Dirección Entrega Beneficio',
      'en': '',
    },
  },
  // mensajeExito
  {
    'hvty4rmu': {
      'es': 'Guardado exitosamente!',
      'en': '',
    },
  },
  // mensajeDireccion
  {
    'hbj7lmxd': {
      'es': 'Dirección Seleccionada!',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '0g1fqtio': {
      'es': 'Para scan de QR o Barcode, esta APP necesita su permiso',
      'en': '',
    },
    'o4fege9r': {
      'es': '',
      'en': '',
    },
    '7f2c2bmp': {
      'es': '',
      'en': '',
    },
    'xiau7kq7': {
      'es': '',
      'en': '',
    },
    '22u9zstd': {
      'es': '',
      'en': '',
    },
    'j8r01q4w': {
      'es': '',
      'en': '',
    },
    'y0o0bipw': {
      'es': '',
      'en': '',
    },
    '97t9xtqr': {
      'es': '',
      'en': '',
    },
    '2i4b0vv2': {
      'es': '',
      'en': '',
    },
    '8dz1w7tx': {
      'es': '',
      'en': '',
    },
    'cyv9cdhc': {
      'es': '',
      'en': '',
    },
    '5af3hza3': {
      'es': '',
      'en': '',
    },
    'i0yaxdjl': {
      'es': '',
      'en': '',
    },
    'bh54q5fh': {
      'es': '',
      'en': '',
    },
    'er3r9r3b': {
      'es': '',
      'en': '',
    },
    'crxyb85o': {
      'es': '',
      'en': '',
    },
    'svs7irwi': {
      'es': '',
      'en': '',
    },
    'ma29ws0t': {
      'es': '',
      'en': '',
    },
    'wb86kig3': {
      'es': '',
      'en': '',
    },
    '6b7zfpp4': {
      'es': '',
      'en': '',
    },
    'a5yo4j1c': {
      'es': '',
      'en': '',
    },
    'fkebe0dw': {
      'es': '',
      'en': '',
    },
    '3mpumqvr': {
      'es': '',
      'en': '',
    },
    'xbvjjn4l': {
      'es': '',
      'en': '',
    },
    '689xl6s4': {
      'es': '',
      'en': '',
    },
    'ff3d8w4h': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));

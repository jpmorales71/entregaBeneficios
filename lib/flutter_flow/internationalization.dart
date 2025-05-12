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
      'es': 'Login',
      'en': '',
    },
    'ox3g73en': {
      'es':
          'Ingrese los siguientes datos para ingresar a nuestra app de Beneficios.',
      'en': '',
    },
    'kp88xl67': {
      'es': '',
      'en': '',
    },
    'h1nvu7al': {
      'es': 'Usuario',
      'en': '',
    },
    'w3i51p0l': {
      'es': 'Password',
      'en': '',
    },
    'l95r4pc1': {
      'es': 'Ingresar',
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
      'es': 'Firma Responsable',
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
    'ibvmrjcy': {
      'es': 'Beneficiario',
      'en': '',
    },
    'gpd2jzsf': {
      'es': 'RUT',
      'en': '',
    },
    'nl1jsqzk': {
      'es': 'Pasaporte/DNI',
      'en': '',
    },
    'fff1689t': {
      'es': 'Nombres',
      'en': '',
    },
    'n3sm4lth': {
      'es': 'Paterno',
      'en': '',
    },
    '114izwqx': {
      'es': 'Materno',
      'en': '',
    },
    'qxf2oym6': {
      'es': 'Domicilio',
      'en': '',
    },
    'zqmg7st3': {
      'es': 'U.V',
      'en': '',
    },
    'r21lm562': {
      'es': 'Telefono',
      'en': '',
    },
    'y5y3mgob': {
      'es': 'Email',
      'en': '',
    },
    '21d1ch8w': {
      'es': 'RUT is required',
      'en': '',
    },
    'ly3thi3z': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ufsehae0': {
      'es': 'Pasaporte/DNI is required',
      'en': '',
    },
    'zf45cl3m': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9n82l4gm': {
      'es': 'Nombres is required',
      'en': '',
    },
    'j14vqcrc': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'uzz2pqk7': {
      'es': 'Paterno is required',
      'en': '',
    },
    '6m365f3o': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0pe2of0i': {
      'es': 'Materno is required',
      'en': '',
    },
    '6vd9azxz': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qctnpe00': {
      'es': 'Domicilio is required',
      'en': '',
    },
    'wnh5a0tf': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ngxk4clq': {
      'es': 'U.V is required',
      'en': '',
    },
    '4h3mt9co': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'cv6yxwcy': {
      'es': 'Telefono is required',
      'en': '',
    },
    'brmgxxij': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '81mds6t6': {
      'es': 'Email is required',
      'en': '',
    },
    'zjmj13l6': {
      'es': 'Please choose an option from the dropdown',
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
  // misEntregas
  {
    'kjk52ie6': {
      'es': 'Buscar en Mis Entregas Realizadas...',
      'en': '',
    },
    '7z8t5y4s': {
      'es': 'Mis entregas',
      'en': '',
    },
  },
  // miResumen
  {
    '01u80s8x': {
      'es': 'Panel de Control',
      'en': '',
    },
    'pww6wpqa': {
      'es': 'Resumen Diario',
      'en': '',
    },
    'gtqszr71': {
      'es': '157',
      'en': '',
    },
    'dk55nwkd': {
      'es': 'Total Recibidos',
      'en': '',
    },
    'cc6bgedl': {
      'es': '57',
      'en': '',
    },
    'fptmcjv2': {
      'es': 'Entregados',
      'en': '',
    },
    'dciar8z9': {
      'es': '100',
      'en': '',
    },
    '4cv1vip0': {
      'es': 'Pendientes',
      'en': '',
    },
    'gy4xjroy': {
      'es': '100',
      'en': '',
    },
    '0kn88fdl': {
      'es': 'Devueltos',
      'en': '',
    },
    'o57q407g': {
      'es': 'Home',
      'en': '',
    },
  },
  // HomePage
  {
    '5kq142np': {
      'es': 'Entrega de Beneficios',
      'en': '',
    },
    'bklh5drl': {
      'es': '©Desarrollado por DTI 2025, todos los derechos reservados.',
      'en': '',
    },
    '860kkxf3': {
      'es': 'Módulo Líder',
      'en': '',
    },
    'u034nl9l': {
      'es': 'Recepción de vales',
      'en': '',
    },
    '287k7ysd': {
      'es': '(Entrega de DIDECO a LIDER)',
      'en': '',
    },
    'a5q6g5y0': {
      'es': 'Distribución de vales',
      'en': '',
    },
    'uje1ydx1': {
      'es': '(Entrega de vales a Equipo)',
      'en': '',
    },
    'vf873r47': {
      'es': 'Rendición de vales',
      'en': '',
    },
    '6mgs60qt': {
      'es': '(Cuadratura al final del día)',
      'en': '',
    },
    '7p4k76ki': {
      'es': 'Entregas',
      'en': '',
    },
    '4wtv5uz5': {
      'es': 'Registro de Firma Responsable',
      'en': '',
    },
    'ceus9yhu': {
      'es': '(Firma de quien entrega los vales en terreno)',
      'en': '',
    },
    'kzkjqglv': {
      'es': 'Registro de Domicilio',
      'en': '',
    },
    'jdergl1u': {
      'es': '(Domicilio del beneficiario)',
      'en': '',
    },
    'b7plpzk2': {
      'es': 'Registro de Beneficiario',
      'en': '',
    },
    '3u8ax1ub': {
      'es': '(Lectura QR y/o ingreso datos personales)',
      'en': '',
    },
    'pi6wetal': {
      'es': 'Lectura QR vale',
      'en': '',
    },
    'q74q22c3': {
      'es': '(Lectura QR y/o ingreso datos personales)',
      'en': '',
    },
    'iwy9epm5': {
      'es': 'Entrega',
      'en': '',
    },
    'w8p3bpbe': {
      'es': '(Lectura QR y/o ingreso datos personales)',
      'en': '',
    },
    'yujjnsic': {
      'es': 'Menú',
      'en': '',
    },
  },
  // lecturaQRVale
  {
    'ypfamdq6': {
      'es': 'Cancel',
      'en': '',
    },
    '0p7jdyh1': {
      'es': 'QR Vale',
      'en': '',
    },
    'loue1ayg': {
      'es': 'Cancel',
      'en': '',
    },
    'lfijxrze': {
      'es': 'Lectura QR Vale',
      'en': '',
    },
  },
  // direccionesTest
  {
    '45xck5ko': {
      'es': 'TextField',
      'en': '',
    },
    '2m9limpe': {
      'es': 'Option 1',
      'en': '',
    },
    'vky88dfn': {
      'es': '1',
      'en': '',
    },
    'u8zga7sm': {
      'es': 'Select...',
      'en': '',
    },
    '2n3kbyki': {
      'es': 'Search...',
      'en': '',
    },
    'p7yv9u03': {
      'es': 'Page Title',
      'en': '',
    },
    'yz5mq40g': {
      'es': 'Home',
      'en': '',
    },
  },
  // Calles
  {
    'ebrb05zy': {
      'es': 'Select...',
      'en': '',
    },
    'msmp3n26': {
      'es': 'Search...',
      'en': '',
    },
    '4b8uhzbo': {
      'es': 'Option 1',
      'en': '',
    },
    'no72t9sk': {
      'es': 'Option 2',
      'en': '',
    },
    '9o138s56': {
      'es': 'Option 3',
      'en': '',
    },
    'iu3vxo4v': {
      'es': 'Page Title',
      'en': '',
    },
    '0k1w5xdo': {
      'es': 'Home',
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
  // registraNuevaPersona
  {
    '19elc3pb': {
      'es': 'Registra nueva Persona',
      'en': '',
    },
    'gyy7ip71': {
      'es': 'RUT',
      'en': '',
    },
    'vfbfokf2': {
      'es': 'Pasaporte/DNI',
      'en': '',
    },
    '0unuafj8': {
      'es': 'Nombres',
      'en': '',
    },
    'tjzirwgj': {
      'es': 'Paterno',
      'en': '',
    },
    'eif0p34k': {
      'es': 'Materno',
      'en': '',
    },
    'ud8d9eys': {
      'es': 'Domicilio',
      'en': '',
    },
    'mwalk47x': {
      'es': 'U.V',
      'en': '',
    },
    '0v6cj399': {
      'es': 'Telefono',
      'en': '',
    },
    'v5ip3vay': {
      'es': 'Email',
      'en': '',
    },
    '75u2qfgf': {
      'es': 'RUT is required',
      'en': '',
    },
    'yckuevu1': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'p0xg41z5': {
      'es': 'Pasaporte/DNI is required',
      'en': '',
    },
    '0ql3ovvp': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'f7f86rqd': {
      'es': 'Nombres is required',
      'en': '',
    },
    'rzk6qquk': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2sbwjvgh': {
      'es': 'Paterno is required',
      'en': '',
    },
    'bozyutg3': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    't15m41dj': {
      'es': 'Materno is required',
      'en': '',
    },
    '26hziaeq': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'kqh040we': {
      'es': 'Domicilio is required',
      'en': '',
    },
    '007ven5h': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fban3xuf': {
      'es': 'U.V is required',
      'en': '',
    },
    'w5msjhcj': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'syw4tcj7': {
      'es': 'Telefono is requerido',
      'en': '',
    },
    '5hyhsuvp': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'tojslnf0': {
      'es': 'Email is required',
      'en': '',
    },
    '5l4i49mv': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wq6fj2t5': {
      'es': 'Cancelar',
      'en': '',
    },
    '51paxt89': {
      'es': 'Registrar',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '0g1fqtio': {
      'es': 'Para scan de QR o Barcode, esta APP necesita su permiso',
      'en': '',
    },
    'p7vzhd34': {
      'es': '',
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

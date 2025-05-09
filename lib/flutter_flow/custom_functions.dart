import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/custom_auth/auth_util.dart';

String extraerTextoDireccion(String direccion) {
  // of the following string extracts the text from the first character to the first comma. Taking only non-numeric text. Example mi cas 33, la florida
  String text = '';
  for (int i = 0; i < direccion.length; i++) {
    if (!direccion[i].contains(RegExp(r'[0-9]')) && direccion[i] != ',') {
      text += direccion[i];
    } else {
      break;
    }
  }
  return text.trim();
}

int extraerNumeroDireccion(String direccion) {
  // from the following string extracts the number from the first character to the first comma from left to right. Taking only numbers not text. Example string my house is blue 23456, la florida, mm 42
  // Find the index of the first comma in the string
  int commaIndex = direccion.indexOf(',');

  // Extract the substring from the start of the string to the first comma
  String substring = direccion.substring(0, commaIndex);

  // Remove any non-numeric characters from the substring
  String numericString = substring.replaceAll(RegExp(r'[^0-9]'), '');

  // Parse the numeric string to an integer
  int numero = int.tryParse(numericString) ?? 0;

  return numero;
}

String? latitudFromCoordenadas(String? coordenadas) {
  // // // I have a coordinates field of type string, I receive the latitude and longitude data. I need a function that separates latitude and returns a  latitude only number. between "lat: " and the first ”,”
  if (coordenadas == null) {
    return null;
  }

  final startIndex = coordenadas.indexOf("lat: ");
  if (startIndex == -1) {
    return null;
  }

  final commaIndex = coordenadas.indexOf(",", startIndex);
  if (commaIndex == -1) {
    return null;
  }

  final latitudString = coordenadas.substring(startIndex + 5, commaIndex);
  return latitudString.trim();
}

String? longitudFromCoordenadas(String? coordenadas) {
  // I have a coordinates field of type string, I receive the latitude and longitude data. I need a function that separates longitude and returns a  longitude only number. between "lng: "  and ")"
  if (coordenadas != null) {
    final startIndex = coordenadas.indexOf('lng: ');
    if (startIndex != -1) {
      final endIndex = coordenadas.indexOf(')', startIndex);
      if (endIndex != -1) {
        final longitudeString = coordenadas.substring(startIndex + 5, endIndex);
        return longitudeString.trim();
      }
    }
  }
  return null;
}

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
import '/auth/custom_auth/auth_util.dart';

String captureSignatureOld(String base64Signature) {
  // Simplemente devuelve el valor
  return base64Signature;
}

String firmaToBase64(FFUploadedFile firma) {
  final bytes = firma.bytes;

  if (bytes == null || bytes.isEmpty) {
    return '';
  }

  return base64Encode(bytes);
}

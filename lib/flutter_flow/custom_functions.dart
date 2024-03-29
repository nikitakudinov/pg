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
import '/auth/supabase_auth/auth_util.dart';

int? newCustomFunction(List<int> iDSarray) {
  // random value from IDSarray
  final random = math.Random();
  if (iDSarray.isEmpty) {
    return null;
  }
  final index = random.nextInt(iDSarray.length);
  return iDSarray[index];
}

int? stringTOinteger(String? stringData) {
  // covert string to integer
  if (stringData == null) {
    return null;
  }
  try {
    return int.parse(stringData);
  } catch (e) {
    return null;
  }
}

DateTime? timeNsecAgo(int? valueSeconds) {
  // curent time valueSeconds ago
  if (valueSeconds == null) return null;
  final now = DateTime.now();
  final duration = Duration(seconds: valueSeconds);
  return now.subtract(duration);
}

DateTime? stringDateToDateTime(String? dateString) {
  // convert dateString to DateTime type
  if (dateString == null) {
    return null;
  }
  try {
    return DateTime.parse(dateString);
  } catch (e) {
    return null;
  }
}

String? arrayToString(List<String> array) {
  // convert array to string
  return array.join(',');
}

List<String> stringToArray(String? stringValue) {
  // stringValue to Array
  if (stringValue == null) {
    return [];
  } else {
    return stringValue.split(',');
  }
}

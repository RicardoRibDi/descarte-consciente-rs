import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? hasNoChats(List<ChatsRecord>? allChats) {
  return allChats?.isEmpty ?? true;
}

double? ratingSummary(
  double totalRatings,
  double rating,
) {
  if (totalRatings > 0) {
    return (rating +
            (totalRatings - rating) ~/ math.max((totalRatings ~/ 5), 1)) /
        2;
  } else {
    return rating;
  }
}

double ratingSummaryList(List<AvaliacoesRecord> rating) {
  if (rating.isEmpty) {
    return 0.0;
  }
  var ratingsSum = 0.0;
  for (final comment in rating) {
    ratingsSum += comment.avaliacao!;
  }
  return double.parse((ratingsSum / rating.length).toStringAsFixed(1));
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kColorInfected = Color(0xFFFF8748);
const kTitleTextColor = Color(0xFF303030);
const kDeathColor = Color(0xFFFF4848);
const kRecoverColor = Color(0xFF36C12C);
const kSuspectsColor = Color(0x8889216B);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);
final kFlagsURL = "https://devarthurribeiro.github.io/covid19-brazil-api/static/flags/";
final currencyFormat = NumberFormat.decimalPattern('pt_BR');

const kTitleTextstyle = TextStyle(
  fontSize: 18,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

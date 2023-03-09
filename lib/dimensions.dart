import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
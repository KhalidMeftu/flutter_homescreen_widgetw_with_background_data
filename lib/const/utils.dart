import 'package:flutter/material.dart';

Widget loadingSpinner = const Center(
  child: SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        strokeWidth: 3,
      )),
);

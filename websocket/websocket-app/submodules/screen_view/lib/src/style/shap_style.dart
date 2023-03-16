import 'package:flutter/material.dart';

RoundedRectangleBorder modalBottomSheetDefaultShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    ),
  );
}

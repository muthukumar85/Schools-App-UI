import 'package:flutter/material.dart';
import 'package:schools/constants/Theme.dart';

PreferredSizeWidget AppBars(name){
    return AppBar(
      title: Text(name),
      backgroundColor: ArgonColors.primary,
    );
}

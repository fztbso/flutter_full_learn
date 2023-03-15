import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/navigator/navigator_manager.dart';

mixin NavigatorMixin {
  NavigatorManagerr get router => NavigatorManagerr.instance;
}
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var isEnabled = true.obs;

  void toggleButton(bool isEnable) {
    isEnabled.value = isEnable;
  }
}

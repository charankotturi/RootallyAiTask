import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/models/session_model.dart';

class HomePageController extends GetxController {
  var model = null.obs;
  var currentDate = "".obs;
  var list = [].obs;
  var maxPosition = 0.obs;

  @override
  void onInit() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    currentDate.value = formatter.format(now);

    getSessionData(() {}).then((value) {});
    super.onInit();
  }

  Future<void> setSessionData(Function() onComplete) async {
    String time = DateFormat("hh:mm:ss a").format(DateTime.now());
    int size = maxPosition.value + 1;
    Future.delayed(const Duration(seconds: 1)).then((value) {});

    FirebaseDatabase.instance
        .ref()
        .child("sessions")
        .child(currentDate.value)
        .child(time)
        .set(size.toString())
        .then((value) async {
      await getSessionData(onComplete);
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  Future<void> getSessionData(Function() onComplete) async {
    FirebaseDatabase.instance
        .ref()
        .child("sessions/" + currentDate.value)
        .get()
        .then((value) {
      var tempList = [];
      for (var element in value.children) {
        tempList.add(SessionModel(
            time: element.key.toString(), position: element.value.toString()));
      }
      maxPosition.value = tempList.length;

      list.value = tempList;
      onComplete();
    });
  }
}

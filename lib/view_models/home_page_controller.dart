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

    getSessionData();
    super.onInit();
  }

  setSessionData() async {
    String time = DateFormat("hh:mm:ss a").format(DateTime.now());
    int size = list.length + 1;
    list.add(SessionModel(time: time, position: size.toString()));

    FirebaseDatabase.instance
        .ref()
        .child("sessions")
        .child(currentDate.value)
        .child(time)
        .set(size.toString())
        .then((value) {
      getSessionData();
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  void getSessionData() {
    FirebaseDatabase.instance
        .ref()
        .child("sessions/" + currentDate.value)
        .get()
        .then((value) {
      if (value.exists) {
        var tempList = [];
        for (var element in value.children) {
          tempList.add(SessionModel(
              time: element.key.toString(),
              position: element.value.toString()));

          if (int.parse(element.value.toString()) > maxPosition.value) {
            maxPosition.value = int.parse(element.value.toString());
          }
        }

        list.value = tempList;
      }
    });
  }
}

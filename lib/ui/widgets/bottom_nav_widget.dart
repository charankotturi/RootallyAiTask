import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/view_models/bottom_nav_controller.dart';

buildBottomNavigationMenu(context, BottomNavController controller) {
  return Obx(() => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SizedBox(
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          backgroundColor: const Color(0XFFf2f2f2),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          // unselectedLabelStyle: unselectedLabelStyle,
          // selectedLabelStyle: selectedLabelStyle,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.home,
                  size: 20.0,
                ),
              ),
              label: 'Home',
              backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.sports_gymnastics,
                  size: 20.0,
                ),
              ),
              label: 'Rehab',
              backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            ),
          ],
        ),
      )));
}

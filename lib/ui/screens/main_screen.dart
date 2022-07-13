import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/ui/screens/home_page.dart';
import 'package:task/ui/screens/rehab_page.dart';
import 'package:task/ui/widgets/bottom_nav_widget.dart';
import 'package:task/view_models/bottom_nav_controller.dart';
import 'package:task/view_models/home_page_controller.dart';
import 'package:task/view_models/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller =
        Get.put(BottomNavController(), permanent: false);
    var tabView = MediaQuery.of(context).size.width > 760;

    final homeController = Get.put(HomePageController(), permanent: false);
    final mainController = Get.put(MainController(), permanent: false);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context, controller),
        floatingActionButtonLocation: tabView
            ? FloatingActionButtonLocation.startFloat
            : FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(() => controller.tabIndex.value == 0
            ? FloatingActionButton.extended(
                onPressed: mainController.isEnabled.value
                    ? () async {
                        if (homeController.maxPosition.value == 30) {
                          return;
                        }

                        mainController.toggleButton(false);
                        await homeController.setSessionData(() {
                          mainController.toggleButton(true);
                        });
                      }
                    : null,
                label: SizedBox(
                  width: 330,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Start Session!"),
                      ],
                    ),
                  ),
                ))
            : Container()),
        body: Obx(() => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomePage(
                  controller: homeController,
                ),
                const RehabPage()
              ],
            )),
      ),
    );
  }
}

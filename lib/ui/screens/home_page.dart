import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/models/session_model.dart';
import 'package:task/ui/widgets/progress_widget.dart';
import 'package:task/ui/widgets/session_widget.dart';
import 'package:task/utils/constants.dart';
import 'package:task/view_models/home_page_controller.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller;
  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabView = MediaQuery.of(context).size.width > 760;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Flex(
            direction: tabView ? Axis.horizontal : Axis.vertical,
            children: [
              SizedBox(
                height: 15,
                width: tabView ? 20 : 0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: tabView
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    "Good Morining,\nJames",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() => ProgressWidget(
                        maxPosition: controller.maxPosition.value,
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: sessionsSize,
                itemBuilder: ((context, index) {
                  return Obx(() => SessionWidget(
                      maxPosition: controller.list.length,
                      index: index,
                      time: index >= controller.list.length
                          ? "time"
                          : (controller.list[index] as SessionModel).time));
                }),
              ))
            ]),
      ),
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:task/models/date_time_model.dart';
import 'package:task/ui/widgets/result_item_widget.dart';
import 'package:task/utils/constants.dart';
import 'package:task/view_models/database_controller.dart';
import 'package:task/view_models/home_page_controller.dart';

class RehabPage extends StatelessWidget {
  const RehabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rehab Programme",
                style: theme.textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                child: const Center(
                    child: Text(
                  "Fake Card LoL",
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("History",
                      style: theme.textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  const Icon(Icons.sort)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 75,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.17),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Total Sessions"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.sports_gymnastics),
                          Text("32", style: theme.textTheme.headline6)
                        ],
                      )
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Container(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Total Time"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.scale,
                          ),
                          Text("16", style: theme.textTheme.headline6)
                        ],
                      )
                    ],
                  ))
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseDatabase.instance
                        .ref()
                        .child("sessions/")
                        .onValue,
                    builder: (context, snapshot) {
                      var list = [];
                      if (snapshot.data == null) {
                        return Container();
                      }
                      Map dateMap = (snapshot.data as DatabaseEvent)
                          .snapshot
                          .value as Map<dynamic, dynamic>;
                      dateMap.forEach((dateKey, value) {
                        Map map = value as Map<dynamic, dynamic>;
                        map.forEach((key, value) {
                          var model = DateTimeModel(date: dateKey, time: key);
                          list.add(model);
                        });
                      });
                      return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: ((context, index) {
                          return ResultWidget(
                            model: list[index],
                          );
                        }),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

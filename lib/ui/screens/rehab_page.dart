import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:task/models/date_time_model.dart';
import 'package:task/ui/widgets/result_item_widget.dart';

class RehabPage extends StatelessWidget {
  const RehabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabView = MediaQuery.of(context).size.width > 760;

    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Flex(
            direction: tabView ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 450),
                    child: Row(
                      children: [
                        Text(
                          "Rehab Programme",
                          style: theme.textTheme.headline5?.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    constraints: const BoxConstraints(maxWidth: 450),
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
                  Container(
                    constraints: const BoxConstraints(maxWidth: 450),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("History",
                            style: theme.textTheme.headline5?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const Icon(Icons.sort)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: tabView ? null : 75,
                    width: MediaQuery.of(context).size.width,
                    constraints: const BoxConstraints(maxWidth: 450),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.17),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Flex(
                        direction: tabView ? Axis.vertical : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: tabView ? 10 : 0,
                              ),
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
                          ),
                          !tabView
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 25.0),
                                  child: Container(
                                    height: 30,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10.0),
                                  child: Container(
                                    height: 1,
                                    width: 250,
                                    color: Colors.grey,
                                  ),
                                ),
                          Column(
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
                              ),
                              SizedBox(
                                height: tabView ? 10 : 0,
                              ),
                            ],
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  tabView ? Expanded(child: Container()) : Container()
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 450),
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
                              var model =
                                  DateTimeModel(date: dateKey, time: key);
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

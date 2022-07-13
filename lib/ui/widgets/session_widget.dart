import 'package:flutter/material.dart';
import 'package:task/ui/widgets/seperator_widget.dart';

class SessionWidget extends StatelessWidget {
  final int maxPosition;
  final int index;
  final String time;
  const SessionWidget(
      {Key? key,
      required this.maxPosition,
      required this.index,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding:
          EdgeInsets.only(right: 8.0, top: 5.0, bottom: index == 29 ? 75 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Progess Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 155,
              child:
                  LayoutBuilder(builder: (context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    Visibility(
                      visible: index != 0,
                      child: Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        bottom: constraints.constrainHeight() / 2,
                        child: MySeparator(
                          width: 2.5,
                          color:
                              index <= maxPosition ? Colors.blue : Colors.grey,
                          constraints: constraints,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index != 29,
                      child: Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        top: constraints.constrainHeight() / 2,
                        child: MySeparator(
                          width: 2.5,
                          color:
                              index < maxPosition ? Colors.blue : Colors.grey,
                          constraints: constraints,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        color: Colors.white,
                        child: Icon(
                          index == maxPosition
                              ? Icons.run_circle
                              : index < maxPosition
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                          size: index == maxPosition ? 25 : 17,
                          color: index == maxPosition
                              ? const Color(0XFFf3c30a)
                              : index < maxPosition
                                  ? Colors.blue
                                  : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),

          // Session Card
          Opacity(
            opacity: index < maxPosition ? 0.4 : 1.0,
            child: Padding(
              padding: const EdgeInsets.all(12.5),
              child: Container(
                height: 130,
                constraints: const BoxConstraints(maxWidth: 300),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 2.5, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Session " + (index + 1).toString(),
                              style: theme.textTheme.headline5
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 23.0,
                              decoration: BoxDecoration(
                                  color: index == maxPosition
                                      ? const Color(0XFFf3c30a)
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(23.0)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    index == maxPosition
                                        ? "Performed"
                                        : "Completed",
                                    style: theme.textTheme.subtitle2
                                        ?.copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Visibility(
                                visible: index == maxPosition,
                                child: Text(
                                  "Enter pain score",
                                  style: theme.textTheme.caption,
                                )),
                            const SizedBox(
                              height: 2,
                            ),
                            Visibility(
                              visible: index >= maxPosition,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: Colors.blue),
                                    child: Center(
                                      child: Icon(
                                        index == maxPosition
                                            ? Icons.repeat
                                            : Icons.play_arrow,
                                        size: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: Colors.grey.withOpacity(0.5)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          index == maxPosition
                                              ? "Repeat"
                                              : "Start",
                                          style: theme.textTheme.button,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                                visible: index < maxPosition,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Performed at: ",
                                        style: theme.textTheme.caption),
                                    Text(time, style: theme.textTheme.bodyText2)
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          "https://images.clipartlogo.com/files/istock/previews/9653/96539555-cartoon-people-doing-plank-with-arm-extension-exercise.jpg",
                          height: 130,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task/utils/constants.dart';

class ProgressWidget extends StatelessWidget {
  final int maxPosition;
  const ProgressWidget({Key? key, required this.maxPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: const BoxConstraints(maxWidth: 350),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 2.5, color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today's Progress",
                    style: theme.textTheme.headline5?.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold)),
                Text("${((maxPosition / sessionsSize) * 100).floorToDouble()}%",
                    style: theme.textTheme.headline5?.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Progress Bar
            LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 10,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 10,
                      width:
                          constraints.maxWidth * (maxPosition / sessionsSize),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              );
            }),
            const SizedBox(
              height: 15,
            ),
            // Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Completed",
                          style: theme.textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "$maxPosition Sessions",
                          style: theme.textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pending",
                          style: theme.textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "${sessionsSize - maxPosition} Sessions",
                          style: theme.textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

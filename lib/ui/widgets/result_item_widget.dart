import "package:flutter/material.dart";
import 'package:task/models/date_time_model.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key, required this.model}) : super(key: key);
  final DateTimeModel model;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/cute-carrot-workout-cartoon-vector-icon-illustration-sport-vegetable-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-1445.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 14,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(model.time, style: theme.textTheme.caption)
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 14,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(model.date, style: theme.textTheme.caption)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Center(
              child: Text("View Result"),
            )
          ],
        ),
      ),
    );
  }
}

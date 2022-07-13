import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  const MySeparator(
      {Key? key,
      this.width = 1,
      this.color = Colors.black,
      required this.constraints})
      : super(key: key);
  final double width;
  final Color color;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        final boxHeight = constraints.constrainHeight() / 2;
        final dashWidth = width;
        const dashHeight = 5.0;
        final dashCount = (boxHeight / (2 * dashHeight)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(2.5)),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
        );
      },
    );
  }
}

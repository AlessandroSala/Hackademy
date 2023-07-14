import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.body, required this.priority});

  final String body;
  final String priority;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: body,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12,
              fontFamily: 'Montserrat',
            ),
        children: <TextSpan>[
          TextSpan(
              text: priority, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      maxLines: 3,
    );
  }
}

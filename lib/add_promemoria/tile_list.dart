import 'package:flutter/material.dart';

import '../models/lista.dart';

class TileLista extends StatelessWidget {
  const TileLista({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
  });

  final int value;
  final int groupValue;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {},
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(width: double.infinity, child: title),
        ),
      ],
    );
  }
}

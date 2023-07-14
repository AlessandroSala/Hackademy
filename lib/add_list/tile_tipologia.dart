import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/lista.dart';

class TileTipologia extends StatelessWidget {
  const TileTipologia(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.title,
      required this.description});

  final Tipologia value;
  final Tipologia groupValue;
  final Widget description;
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
            flex: 2, child: Container(width: double.infinity, child: title)),
        Flexible(
          flex: 4,
          child: Container(
            width: double.infinity,
            child: description,
          ),
        ),
      ],
    );
  }
}

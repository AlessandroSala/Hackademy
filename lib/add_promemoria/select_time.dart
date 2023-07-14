import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackademy/palette.dart';

import '../body_text.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios),
                            const BodyText(
                              "Indietro",
                              fontSize: 13,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "Ora",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context, time);
                          },
                          child: BodyText(
                            "Fine",
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Theme(
              data: ThemeData(
                colorScheme: ColorScheme.light(),
                primaryColor: Colors.white,
                backgroundColor: Colors.white,
              ),
              child: Container(
                height: 60,
                child: TimePickerDialog(
                  initialTime: TimeOfDay.now(),
                  // : (value) {
                  //   time = TimeOfDay(hour: value.hour, minute: value.minute);
                  // },
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ]),
        ),
      ),
    );
  }
}

TimeOfDay minutesToTimeOfDay(int minutes) {
  Duration duration = Duration(minutes: minutes);
  List<String> parts = duration.toString().split(':');
  return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
}

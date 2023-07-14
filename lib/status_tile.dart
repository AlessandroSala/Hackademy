import 'package:flutter/material.dart';
import 'package:hackademy/palette.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({
    super.key,
    this.count = 0,
    this.icon = const Icon(Icons.calendar_month),
    this.title = "WIP",
  });
  final int count;
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x000A0348),
            Color(0xff0A0348),
          ],
        ),
        border: Border.all(
          color: Palette.yellow.withAlpha(200),
        ),
      ),
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(
                count.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

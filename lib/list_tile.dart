import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackademy/models/lista.dart';
import 'package:hackademy/pagina_lista/detail_list.dart';
import 'package:hackademy/palette.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, this.title = "WIP", this.count = 0, required this.lista});

  final String title;
  final int count;
  final Lista lista;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ListaDetail.routeName,
        arguments: lista,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  count.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

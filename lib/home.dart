import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackademy/add_list/main_form.dart';
import 'package:hackademy/add_promemoria/main_form.dart';
import 'package:hackademy/db/db.dart';
import 'package:hackademy/list_tile.dart';
import 'package:hackademy/status_tile.dart';

import 'body_text.dart';
import 'models/lista.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Ricerca promemoria",
                prefixIcon: Theme(
                  data: ThemeData(),
                  child: Icon(Icons.search),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 5.5,
                              bottom: 5.5,
                            ),
                            child: StatusTile(),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 5.5,
                              bottom: 5.5,
                            ),
                            child: StatusTile(
                              count: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 5.5,
                              top: 5.5,
                            ),
                            child: StatusTile(),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 5.5,
                              top: 5.5,
                            ),
                            child: StatusTile(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Liste Personalizzate",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Transform.rotate(
                          angle: -pi / 2, child: Icon(Icons.arrow_back_ios)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<Lista>>(
                  future: DataBaseManager.fetchLists(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        shrinkWrap: true,
                        children: snapshot.data!
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: CustomListTile(
                                  title: e.titolo,
                                  lista: e,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Divider(
                  thickness: 0.7,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add),
                          SizedBox(
                            width: 5.0,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(AggiungiPromemoria.routeName),
                            child: BodyText(
                              "Promemoria",
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(AddListMainForm.routeName),
                        child: BodyText(
                          "Aggiungi Lista",
                          fontSize: 15,
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

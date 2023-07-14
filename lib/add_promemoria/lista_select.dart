import 'package:flutter/material.dart';
import 'package:hackademy/add_promemoria/tile_list.dart';
import 'package:hackademy/db/db.dart';
import 'package:hackademy/models/lista.dart';

import '../body_text.dart';

class SelectLista extends StatefulWidget {
  const SelectLista({super.key});

  @override
  State<SelectLista> createState() => _SelectListaState();
}

class _SelectListaState extends State<SelectLista> {
  Lista? lista;
  @override
  Widget build(BuildContext context) {
    final titleTheme = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontSize: 13,
        );
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Column(
            children: [
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
                          "Lista",
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
                              Navigator.pop(context, lista);
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
              FutureBuilder(
                future: DataBaseManager.fetchLists(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.map((e) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() {
                                lista = e;
                              }),
                              child: TileLista(
                                value: e.id,
                                groupValue: lista?.id ?? -1,
                                title: Text(
                                  e.titolo,
                                  style: titleTheme,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(
                                height: 0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

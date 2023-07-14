import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackademy/db/db.dart';

import '../body_text.dart';
import '../models/lista.dart';
import 'promemoria_tile.dart';

class ListaDetail extends StatelessWidget {
  const ListaDetail({super.key, required this.lista});

  static const routeName = '/listaDetail';
  final Lista lista;

  @override
  Widget build(BuildContext context) {
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
                          lista.titolo,
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
                        // child: Align(
                        //   alignment: Alignment.centerRight,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.pop(context);
                        //     },
                        //     child: BodyText(
                        //       "Fine",
                        //       fontSize: 13,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              FutureBuilder(
                  future: DataBaseManager.fetchPromemoria(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        shrinkWrap: true,
                        children: snapshot.data!
                            .where((e) => e.id == lista.id)
                            .map((e) => TilePromemoria(promemoria: e))
                            .toList(),
                      );
                    }
                    return Container();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

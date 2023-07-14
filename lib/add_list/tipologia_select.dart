import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackademy/add_list/description.dart';
import 'package:hackademy/add_list/tile_tipologia.dart';
import 'package:hackademy/models/lista.dart';

import '../body_text.dart';

class SelectTipologia extends StatefulWidget {
  const SelectTipologia({super.key});

  @override
  State<SelectTipologia> createState() => _SelectTipologiaState();
}

class _SelectTipologiaState extends State<SelectTipologia> {
  Tipologia _type = Tipologia.base;
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
          child: Column(children: [
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
                        "Tipologia",
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
                            Navigator.pop(context, _type);
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
            GestureDetector(
              onTap: () => setState(() {
                _type = Tipologia.base;
              }),
              child: TileTipologia(
                value: Tipologia.base,
                groupValue: _type,
                title: Text(
                  "Base",
                  style: titleTheme,
                ),
                description: Container(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _type = Tipologia.alta;
              }),
              child: TileTipologia(
                  value: Tipologia.alta,
                  groupValue: _type,
                  title: Text(
                    "Alta priorità",
                    style: titleTheme,
                  ),
                  description: Description(
                    body:
                        "Contiene i promemoria delle altre liste con priorità ",
                    priority: "alta",
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _type = Tipologia.media;
              }),
              child: TileTipologia(
                  value: Tipologia.media,
                  groupValue: _type,
                  title: Text(
                    "Media priorità",
                    style: titleTheme,
                  ),
                  description: Description(
                    body:
                        "Contiene i promemoria delle altre\nliste con priorità ",
                    priority: "media",
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _type = Tipologia.bassa;
              }),
              child: TileTipologia(
                  value: Tipologia.bassa,
                  groupValue: _type,
                  title: Text(
                    "Bassa priorità",
                    style: titleTheme,
                  ),
                  description: Description(
                    body:
                        "Contiene i promemoria delle altre\nliste con priorità ",
                    priority: "bassa",
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _type = Tipologia.scadenza;
              }),
              child: TileTipologia(
                  value: Tipologia.scadenza,
                  groupValue: _type,
                  title: Text(
                    "In scadenza",
                    style: titleTheme,
                  ),
                  description: Description(
                    body:
                        "Contiene i promemoria delle altre\nliste che scadono la settimana corrente ",
                    priority: "",
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackademy/add_list/tipologia_select.dart';
import 'package:hackademy/body_text.dart';
import 'package:hackademy/db/db.dart';
import 'package:hackademy/models/lista.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class AddListMainForm extends StatefulWidget {
  const AddListMainForm({super.key});

  static const String routeName = '/addListForm';

  @override
  State<AddListMainForm> createState() => _AddListMainFormState();
}

class _AddListMainFormState extends State<AddListMainForm> {
  final _title = TextEditingController(text: "");
  Tipologia? _type = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const BodyText("Annulla"),
                  ),
                  const Text(
                    "Nuova lista",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: BodyText("Aggiungi", disabled: !_validate()),
                    onTap: _validate()
                        ? () {
                            _add();
                            Navigator.pop(context);
                          }
                        : null,
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Titolo*",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white70),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: TextField(
                            decoration: const InputDecoration.collapsed(
                              hintText: "",
                            ),
                            style: Theme.of(context).textTheme.bodySmall,
                            controller: _title,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 25,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Tipologia*",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white70),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () => Navigator.push<Tipologia?>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectTipologia(),
                              ),
                            ).then((value) {
                              setState(() {
                                _type = value;
                              });
                            }),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _type == null
                                      ? "Scegli tipologia"
                                      : typeToString(_type!),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white38),
                                ),
                                const Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.arrow_forward_ios),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: const Text(
                        "I campi contrassegnati con l'asterisco (*) sono obbligatori",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white38,
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validate() {
    return _title.text != "" && _type != null;
  }

  void _add() {
    final list = Lista(
      id: Random().nextInt(200000),
      titolo: _title.text,
      tipologia: _type!,
    );
    DataBaseManager.addEntity<Lista>(list);
  }
}

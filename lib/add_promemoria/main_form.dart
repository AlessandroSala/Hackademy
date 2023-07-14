import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackademy/add_promemoria/lista_select.dart';
import 'package:hackademy/add_promemoria/select_data.dart';
import 'package:hackademy/add_promemoria/select_time.dart';
import 'package:hackademy/body_text.dart';
import 'package:hackademy/db/db.dart';
import 'package:hackademy/models/lista.dart';
import 'package:hackademy/models/promemoria.dart';

class AggiungiPromemoria extends StatefulWidget {
  const AggiungiPromemoria({super.key});

  static const String routeName = "/aggiungiPromemoria";

  @override
  State<AggiungiPromemoria> createState() => _AggiungiPromemoriaState();
}

class _AggiungiPromemoriaState extends State<AggiungiPromemoria> {
  final _title = TextEditingController(text: "");
  final _note = TextEditingController(text: "");
  DateTime? _expiration;
  TimeOfDay? _time;
  Lista? _lista;
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
                      "Nuovo promemoria",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: BodyText("Aggiungi", disabled: !_validate()),
                      onTap: () {
                        _add();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(children: [
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
                              "Scadenza",
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
                            onTap: () => Navigator.push<DateTime?>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectDate(),
                              ),
                            ).then((value) {
                              setState(() {
                                _expiration = value;
                              });
                            }),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _expiration == null
                                      ? "Inserisci scadenza"
                                      : _expiration.toString(),
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
                    const Divider(
                      height: 25,
                      color: Colors.white,
                    ),
                    // Row(
                    //   children: [
                    //     const SizedBox(width: 10),
                    //     Flexible(
                    //       flex: 1,
                    //       child: Container(
                    //         width: double.infinity,
                    //         child: Text(
                    //           "Orario",
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .bodySmall!
                    //               .copyWith(color: Colors.white70),
                    //         ),
                    //       ),
                    //     ),
                    //     Flexible(
                    //       flex: 3,
                    //       child: GestureDetector(
                    //         onTap: () => Navigator.push<TimeOfDay?>(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => SelectTime(),
                    //           ),
                    //         ).then((value) {
                    //           setState(() {
                    //             _time = value;
                    //           });
                    //         }),
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Text(
                    //               _time == null
                    //                   ? "Inserisci ora"
                    //                   : _time.toString(),
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .bodySmall!
                    //                   .copyWith(color: Colors.white38),
                    //             ),
                    //             const Expanded(
                    //               child: Align(
                    //                 alignment: Alignment.centerRight,
                    //                 child: Icon(Icons.arrow_forward_ios),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const Divider(
                    //   height: 25,
                    //   color: Colors.white,
                    // ),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Ripetizione",
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
                            onTap: () => Navigator.push<DateTime?>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectDate(),
                              ),
                            ).then((value) {
                              setState(() {
                                _expiration = value;
                              });
                            }),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _expiration == null
                                      ? "Seleziona ripetizione"
                                      : _expiration.toString(),
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
                              "Priorità",
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
                            onTap: () => Navigator.push<DateTime?>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectDate(),
                              ),
                            ).then((value) {
                              setState(() {
                                _expiration = value;
                              });
                            }),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _expiration == null
                                      ? "Inserisci priorità"
                                      : _expiration.toString(),
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
                              "Lista*",
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
                            onTap: () => Navigator.push<Lista?>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectLista(),
                              ),
                            ).then((value) {
                              setState(() {
                                _lista = value;
                              });
                            }),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _lista == null
                                      ? "Seleziona la lista"
                                      : _lista!.titolo,
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
                    const Divider(
                      height: 25,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Note*",
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
                            controller: _note,
                            onChanged: (value) {
                              setState(() {});
                            },
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
                  ]),
                ),
              ],
            ))));
  }

  void _add() {
    DataBaseManager.addEntity<Promemoria>(Promemoria(
        titolo: _title.text,
        note: _note.text,
        scadenza: _expiration!,
        listaId: _lista!.id,
        id: Random().nextInt(20000)));
    Navigator.pop(context);
  }

  bool _validate() {
    return _note.text != "" &&
        _title.text != "" &&
        _lista != null &&
        _expiration != null;
  }
}

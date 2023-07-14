import 'package:flutter/material.dart';
import 'package:hackademy/add_list/main_form.dart';
import 'package:hackademy/add_promemoria/main_form.dart';
import 'package:hackademy/pagina_lista/detail_list.dart';

import 'models/lista.dart';

class Routes {
  static final routes = {
    AddListMainForm.routeName: (BuildContext context) =>
        const AddListMainForm(),
    AggiungiPromemoria.routeName: (BuildContext context) =>
        const AggiungiPromemoria(),
    ListaDetail.routeName: (BuildContext context) =>
        ListaDetail(lista: ModalRoute.of(context)?.settings.arguments as Lista),
  };
}

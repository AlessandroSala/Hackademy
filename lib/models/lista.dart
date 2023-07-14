import 'dart:convert';

import 'package:hackademy/models/serializable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Lista extends Serializable {
  final String titolo;
  final Tipologia tipologia;
  final int id;

  final String tableName = "liste";
  Lista({
    required this.id,
    required this.titolo,
    required this.tipologia,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titolo': titolo,
      'tipologia': tipologia.index,
      'id': id,
    };
  }

  factory Lista.fromMap(Map<String, dynamic> map) {
    return Lista(
      titolo: map['titolo'] as String,
      tipologia: Tipologia.values[map['tipologia']],
      id: map['id'] as int,
    );
  }
}

enum Tipologia {
  base,
  alta,
  media,
  bassa,
  scadenza,
}

String typeToString(Tipologia type) {
  switch (type) {
    case Tipologia.base:
      return "Base";
    case Tipologia.alta:
      return "Alta priorità";
    case Tipologia.media:
      return "Media priorità";
    case Tipologia.bassa:
      return "Bassa priorità";
    case Tipologia.scadenza:
      return "In scadenza";
  }
}

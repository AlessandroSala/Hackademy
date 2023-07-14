// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hackademy/models/serializable.dart';

class Promemoria extends Serializable {
  final String titolo;
  final String note;
  final DateTime scadenza;
  final int listaId;
  final int id;
  final String tableName = "promemoria";
  Promemoria({
    required this.titolo,
    required this.note,
    required this.scadenza,
    required this.listaId,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titolo': titolo,
      'note': note,
      'scadenza': scadenza.millisecondsSinceEpoch,
      'listaId': listaId,
      'id': id,
    };
  }

  factory Promemoria.fromMap(Map<String, dynamic> map) {
    return Promemoria(
      titolo: map['titolo'] as String,
      note: map['note'] as String,
      scadenza: DateTime.fromMillisecondsSinceEpoch(map['scadenza'] as int),
      listaId: map['listaId'] as int,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Promemoria.fromJson(String source) =>
      Promemoria.fromMap(json.decode(source) as Map<String, dynamic>);

  Promemoria copyWith({
    String? titolo,
    String? note,
    DateTime? scadenza,
    int? listaId,
    int? id,
  }) {
    return Promemoria(
      titolo: titolo ?? this.titolo,
      note: note ?? this.note,
      scadenza: scadenza ?? this.scadenza,
      listaId: listaId ?? this.listaId,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'Promemoria(titolo: $titolo, note: $note, scadenza: $scadenza, listaId: $listaId, id: $id)';
  }

  @override
  bool operator ==(covariant Promemoria other) {
    if (identical(this, other)) return true;

    return other.titolo == titolo &&
        other.note == note &&
        other.scadenza == scadenza &&
        other.listaId == listaId &&
        other.id == id;
  }

  @override
  int get hashCode {
    return titolo.hashCode ^
        note.hashCode ^
        scadenza.hashCode ^
        listaId.hashCode ^
        id.hashCode;
  }
}

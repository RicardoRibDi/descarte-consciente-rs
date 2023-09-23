import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MateriaisDBRecord extends FirestoreRecord {
  MateriaisDBRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "plastico" field.
  bool? _plastico;
  bool get plastico => _plastico ?? false;
  bool hasPlastico() => _plastico != null;

  // "vidro" field.
  bool? _vidro;
  bool get vidro => _vidro ?? false;
  bool hasVidro() => _vidro != null;

  // "papel" field.
  bool? _papel;
  bool get papel => _papel ?? false;
  bool hasPapel() => _papel != null;

  // "madeira" field.
  bool? _madeira;
  bool get madeira => _madeira ?? false;
  bool hasMadeira() => _madeira != null;

  // "metal" field.
  bool? _metal;
  bool get metal => _metal ?? false;
  bool hasMetal() => _metal != null;

  // "cortante" field.
  bool? _cortante;
  bool get cortante => _cortante ?? false;
  bool hasCortante() => _cortante != null;

  // "lampada" field.
  bool? _lampada;
  bool get lampada => _lampada ?? false;
  bool hasLampada() => _lampada != null;

  // "eletronico" field.
  bool? _eletronico;
  bool get eletronico => _eletronico ?? false;
  bool hasEletronico() => _eletronico != null;

  // "bateria" field.
  bool? _bateria;
  bool get bateria => _bateria ?? false;
  bool hasBateria() => _bateria != null;

  void _initializeFields() {
    _plastico = snapshotData['plastico'] as bool?;
    _vidro = snapshotData['vidro'] as bool?;
    _papel = snapshotData['papel'] as bool?;
    _madeira = snapshotData['madeira'] as bool?;
    _metal = snapshotData['metal'] as bool?;
    _cortante = snapshotData['cortante'] as bool?;
    _lampada = snapshotData['lampada'] as bool?;
    _eletronico = snapshotData['eletronico'] as bool?;
    _bateria = snapshotData['bateria'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('materiaisDB');

  static Stream<MateriaisDBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MateriaisDBRecord.fromSnapshot(s));

  static Future<MateriaisDBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MateriaisDBRecord.fromSnapshot(s));

  static MateriaisDBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MateriaisDBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MateriaisDBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MateriaisDBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MateriaisDBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MateriaisDBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMateriaisDBRecordData({
  bool? plastico,
  bool? vidro,
  bool? papel,
  bool? madeira,
  bool? metal,
  bool? cortante,
  bool? lampada,
  bool? eletronico,
  bool? bateria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'plastico': plastico,
      'vidro': vidro,
      'papel': papel,
      'madeira': madeira,
      'metal': metal,
      'cortante': cortante,
      'lampada': lampada,
      'eletronico': eletronico,
      'bateria': bateria,
    }.withoutNulls,
  );

  return firestoreData;
}

class MateriaisDBRecordDocumentEquality implements Equality<MateriaisDBRecord> {
  const MateriaisDBRecordDocumentEquality();

  @override
  bool equals(MateriaisDBRecord? e1, MateriaisDBRecord? e2) {
    return e1?.plastico == e2?.plastico &&
        e1?.vidro == e2?.vidro &&
        e1?.papel == e2?.papel &&
        e1?.madeira == e2?.madeira &&
        e1?.metal == e2?.metal &&
        e1?.cortante == e2?.cortante &&
        e1?.lampada == e2?.lampada &&
        e1?.eletronico == e2?.eletronico &&
        e1?.bateria == e2?.bateria;
  }

  @override
  int hash(MateriaisDBRecord? e) => const ListEquality().hash([
        e?.plastico,
        e?.vidro,
        e?.papel,
        e?.madeira,
        e?.metal,
        e?.cortante,
        e?.lampada,
        e?.eletronico,
        e?.bateria
      ]);

  @override
  bool isValidKey(Object? o) => o is MateriaisDBRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoacaoRecord extends FirestoreRecord {
  DoacaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "nomeItem" field.
  String? _nomeItem;
  String get nomeItem => _nomeItem ?? '';
  bool hasNomeItem() => _nomeItem != null;

  // "descricaoItem" field.
  String? _descricaoItem;
  String get descricaoItem => _descricaoItem ?? '';
  bool hasDescricaoItem() => _descricaoItem != null;

  void _initializeFields() {
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _nomeItem = snapshotData['nomeItem'] as String?;
    _descricaoItem = snapshotData['descricaoItem'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doacao');

  static Stream<DoacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoacaoRecord.fromSnapshot(s));

  static Future<DoacaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoacaoRecord.fromSnapshot(s));

  static DoacaoRecord fromSnapshot(DocumentSnapshot snapshot) => DoacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoacaoRecordData({
  DocumentReference? usuario,
  String? nomeItem,
  String? descricaoItem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario': usuario,
      'nomeItem': nomeItem,
      'descricaoItem': descricaoItem,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoacaoRecordDocumentEquality implements Equality<DoacaoRecord> {
  const DoacaoRecordDocumentEquality();

  @override
  bool equals(DoacaoRecord? e1, DoacaoRecord? e2) {
    return e1?.usuario == e2?.usuario &&
        e1?.nomeItem == e2?.nomeItem &&
        e1?.descricaoItem == e2?.descricaoItem;
  }

  @override
  int hash(DoacaoRecord? e) =>
      const ListEquality().hash([e?.usuario, e?.nomeItem, e?.descricaoItem]);

  @override
  bool isValidKey(Object? o) => o is DoacaoRecord;
}

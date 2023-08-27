import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuarios" field.
  List<DocumentReference>? _usuarios;
  List<DocumentReference> get usuarios => _usuarios ?? const [];
  bool hasUsuarios() => _usuarios != null;

  // "usuarioA" field.
  DocumentReference? _usuarioA;
  DocumentReference? get usuarioA => _usuarioA;
  bool hasUsuarioA() => _usuarioA != null;

  // "usuarioB" field.
  DocumentReference? _usuarioB;
  DocumentReference? get usuarioB => _usuarioB;
  bool hasUsuarioB() => _usuarioB != null;

  // "ultimaMsg" field.
  String? _ultimaMsg;
  String get ultimaMsg => _ultimaMsg ?? '';
  bool hasUltimaMsg() => _ultimaMsg != null;

  // "ultimaMsgTempo" field.
  DateTime? _ultimaMsgTempo;
  DateTime? get ultimaMsgTempo => _ultimaMsgTempo;
  bool hasUltimaMsgTempo() => _ultimaMsgTempo != null;

  // "ultimaMsgVistaPor" field.
  List<DocumentReference>? _ultimaMsgVistaPor;
  List<DocumentReference> get ultimaMsgVistaPor =>
      _ultimaMsgVistaPor ?? const [];
  bool hasUltimaMsgVistaPor() => _ultimaMsgVistaPor != null;

  // "ultimaMsgEnviadaPor" field.
  DocumentReference? _ultimaMsgEnviadaPor;
  DocumentReference? get ultimaMsgEnviadaPor => _ultimaMsgEnviadaPor;
  bool hasUltimaMsgEnviadaPor() => _ultimaMsgEnviadaPor != null;

  void _initializeFields() {
    _usuarios = getDataList(snapshotData['usuarios']);
    _usuarioA = snapshotData['usuarioA'] as DocumentReference?;
    _usuarioB = snapshotData['usuarioB'] as DocumentReference?;
    _ultimaMsg = snapshotData['ultimaMsg'] as String?;
    _ultimaMsgTempo = snapshotData['ultimaMsgTempo'] as DateTime?;
    _ultimaMsgVistaPor = getDataList(snapshotData['ultimaMsgVistaPor']);
    _ultimaMsgEnviadaPor =
        snapshotData['ultimaMsgEnviadaPor'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? usuarioA,
  DocumentReference? usuarioB,
  String? ultimaMsg,
  DateTime? ultimaMsgTempo,
  DocumentReference? ultimaMsgEnviadaPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuarioA': usuarioA,
      'usuarioB': usuarioB,
      'ultimaMsg': ultimaMsg,
      'ultimaMsgTempo': ultimaMsgTempo,
      'ultimaMsgEnviadaPor': ultimaMsgEnviadaPor,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.usuarios, e2?.usuarios) &&
        e1?.usuarioA == e2?.usuarioA &&
        e1?.usuarioB == e2?.usuarioB &&
        e1?.ultimaMsg == e2?.ultimaMsg &&
        e1?.ultimaMsgTempo == e2?.ultimaMsgTempo &&
        listEquality.equals(e1?.ultimaMsgVistaPor, e2?.ultimaMsgVistaPor) &&
        e1?.ultimaMsgEnviadaPor == e2?.ultimaMsgEnviadaPor;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.usuarios,
        e?.usuarioA,
        e?.usuarioB,
        e?.ultimaMsg,
        e?.ultimaMsgTempo,
        e?.ultimaMsgVistaPor,
        e?.ultimaMsgEnviadaPor
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}

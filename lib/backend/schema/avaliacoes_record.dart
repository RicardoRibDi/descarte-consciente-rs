import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvaliacoesRecord extends FirestoreRecord {
  AvaliacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "criado_por" field.
  DocumentReference? _criadoPor;
  DocumentReference? get criadoPor => _criadoPor;
  bool hasCriadoPor() => _criadoPor != null;

  // "data_criacao" field.
  DateTime? _dataCriacao;
  DateTime? get dataCriacao => _dataCriacao;
  bool hasDataCriacao() => _dataCriacao != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "avaliacao" field.
  double? _avaliacao;
  double get avaliacao => _avaliacao ?? 0.0;
  bool hasAvaliacao() => _avaliacao != null;

  // "local_descarte" field.
  DocumentReference? _localDescarte;
  DocumentReference? get localDescarte => _localDescarte;
  bool hasLocalDescarte() => _localDescarte != null;

  void _initializeFields() {
    _criadoPor = snapshotData['criado_por'] as DocumentReference?;
    _dataCriacao = snapshotData['data_criacao'] as DateTime?;
    _comentario = snapshotData['comentario'] as String?;
    _avaliacao = castToType<double>(snapshotData['avaliacao']);
    _localDescarte = snapshotData['local_descarte'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('avaliacoes');

  static Stream<AvaliacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvaliacoesRecord.fromSnapshot(s));

  static Future<AvaliacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvaliacoesRecord.fromSnapshot(s));

  static AvaliacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvaliacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvaliacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvaliacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvaliacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvaliacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvaliacoesRecordData({
  DocumentReference? criadoPor,
  DateTime? dataCriacao,
  String? comentario,
  double? avaliacao,
  DocumentReference? localDescarte,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'criado_por': criadoPor,
      'data_criacao': dataCriacao,
      'comentario': comentario,
      'avaliacao': avaliacao,
      'local_descarte': localDescarte,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvaliacoesRecordDocumentEquality implements Equality<AvaliacoesRecord> {
  const AvaliacoesRecordDocumentEquality();

  @override
  bool equals(AvaliacoesRecord? e1, AvaliacoesRecord? e2) {
    return e1?.criadoPor == e2?.criadoPor &&
        e1?.dataCriacao == e2?.dataCriacao &&
        e1?.comentario == e2?.comentario &&
        e1?.avaliacao == e2?.avaliacao &&
        e1?.localDescarte == e2?.localDescarte;
  }

  @override
  int hash(AvaliacoesRecord? e) => const ListEquality().hash([
        e?.criadoPor,
        e?.dataCriacao,
        e?.comentario,
        e?.avaliacao,
        e?.localDescarte
      ]);

  @override
  bool isValidKey(Object? o) => o is AvaliacoesRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalDescarteRecord extends FirestoreRecord {
  LocalDescarteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "nomeLocal" field.
  String? _nomeLocal;
  String get nomeLocal => _nomeLocal ?? '';
  bool hasNomeLocal() => _nomeLocal != null;

  // "materialVidro" field.
  bool? _materialVidro;
  bool get materialVidro => _materialVidro ?? false;
  bool hasMaterialVidro() => _materialVidro != null;

  // "materialPapel" field.
  bool? _materialPapel;
  bool get materialPapel => _materialPapel ?? false;
  bool hasMaterialPapel() => _materialPapel != null;

  // "materialPlastico" field.
  bool? _materialPlastico;
  bool get materialPlastico => _materialPlastico ?? false;
  bool hasMaterialPlastico() => _materialPlastico != null;

  // "materialBateria" field.
  bool? _materialBateria;
  bool get materialBateria => _materialBateria ?? false;
  bool hasMaterialBateria() => _materialBateria != null;

  // "materialEletronico" field.
  bool? _materialEletronico;
  bool get materialEletronico => _materialEletronico ?? false;
  bool hasMaterialEletronico() => _materialEletronico != null;

  // "materialCortante" field.
  bool? _materialCortante;
  bool get materialCortante => _materialCortante ?? false;
  bool hasMaterialCortante() => _materialCortante != null;

  // "materialMadeira" field.
  bool? _materialMadeira;
  bool get materialMadeira => _materialMadeira ?? false;
  bool hasMaterialMadeira() => _materialMadeira != null;

  // "materialMetal" field.
  bool? _materialMetal;
  bool get materialMetal => _materialMetal ?? false;
  bool hasMaterialMetal() => _materialMetal != null;

  // "materialLampada" field.
  bool? _materialLampada;
  bool get materialLampada => _materialLampada ?? false;
  bool hasMaterialLampada() => _materialLampada != null;

  // "localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  bool hasLocalizacao() => _localizacao != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  // "horarioAbertura" field.
  String? _horarioAbertura;
  String get horarioAbertura => _horarioAbertura ?? '';
  bool hasHorarioAbertura() => _horarioAbertura != null;

  // "horarioFechamento" field.
  String? _horarioFechamento;
  String get horarioFechamento => _horarioFechamento ?? '';
  bool hasHorarioFechamento() => _horarioFechamento != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  void _initializeFields() {
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _nomeLocal = snapshotData['nomeLocal'] as String?;
    _materialVidro = snapshotData['materialVidro'] as bool?;
    _materialPapel = snapshotData['materialPapel'] as bool?;
    _materialPlastico = snapshotData['materialPlastico'] as bool?;
    _materialBateria = snapshotData['materialBateria'] as bool?;
    _materialEletronico = snapshotData['materialEletronico'] as bool?;
    _materialCortante = snapshotData['materialCortante'] as bool?;
    _materialMadeira = snapshotData['materialMadeira'] as bool?;
    _materialMetal = snapshotData['materialMetal'] as bool?;
    _materialLampada = snapshotData['materialLampada'] as bool?;
    _localizacao = snapshotData['localizacao'] as LatLng?;
    _descricao = snapshotData['descricao'] as String?;
    _ativo = snapshotData['ativo'] as bool?;
    _horarioAbertura = snapshotData['horarioAbertura'] as String?;
    _horarioFechamento = snapshotData['horarioFechamento'] as String?;
    _endereco = snapshotData['endereco'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('local_descarte');

  static Stream<LocalDescarteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocalDescarteRecord.fromSnapshot(s));

  static Future<LocalDescarteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocalDescarteRecord.fromSnapshot(s));

  static LocalDescarteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocalDescarteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocalDescarteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocalDescarteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocalDescarteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocalDescarteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocalDescarteRecordData({
  DocumentReference? usuario,
  String? nomeLocal,
  bool? materialVidro,
  bool? materialPapel,
  bool? materialPlastico,
  bool? materialBateria,
  bool? materialEletronico,
  bool? materialCortante,
  bool? materialMadeira,
  bool? materialMetal,
  bool? materialLampada,
  LatLng? localizacao,
  String? descricao,
  bool? ativo,
  String? horarioAbertura,
  String? horarioFechamento,
  String? endereco,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuario': usuario,
      'nomeLocal': nomeLocal,
      'materialVidro': materialVidro,
      'materialPapel': materialPapel,
      'materialPlastico': materialPlastico,
      'materialBateria': materialBateria,
      'materialEletronico': materialEletronico,
      'materialCortante': materialCortante,
      'materialMadeira': materialMadeira,
      'materialMetal': materialMetal,
      'materialLampada': materialLampada,
      'localizacao': localizacao,
      'descricao': descricao,
      'ativo': ativo,
      'horarioAbertura': horarioAbertura,
      'horarioFechamento': horarioFechamento,
      'endereco': endereco,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocalDescarteRecordDocumentEquality
    implements Equality<LocalDescarteRecord> {
  const LocalDescarteRecordDocumentEquality();

  @override
  bool equals(LocalDescarteRecord? e1, LocalDescarteRecord? e2) {
    return e1?.usuario == e2?.usuario &&
        e1?.nomeLocal == e2?.nomeLocal &&
        e1?.materialVidro == e2?.materialVidro &&
        e1?.materialPapel == e2?.materialPapel &&
        e1?.materialPlastico == e2?.materialPlastico &&
        e1?.materialBateria == e2?.materialBateria &&
        e1?.materialEletronico == e2?.materialEletronico &&
        e1?.materialCortante == e2?.materialCortante &&
        e1?.materialMadeira == e2?.materialMadeira &&
        e1?.materialMetal == e2?.materialMetal &&
        e1?.materialLampada == e2?.materialLampada &&
        e1?.localizacao == e2?.localizacao &&
        e1?.descricao == e2?.descricao &&
        e1?.ativo == e2?.ativo &&
        e1?.horarioAbertura == e2?.horarioAbertura &&
        e1?.horarioFechamento == e2?.horarioFechamento &&
        e1?.endereco == e2?.endereco;
  }

  @override
  int hash(LocalDescarteRecord? e) => const ListEquality().hash([
        e?.usuario,
        e?.nomeLocal,
        e?.materialVidro,
        e?.materialPapel,
        e?.materialPlastico,
        e?.materialBateria,
        e?.materialEletronico,
        e?.materialCortante,
        e?.materialMadeira,
        e?.materialMetal,
        e?.materialLampada,
        e?.localizacao,
        e?.descricao,
        e?.ativo,
        e?.horarioAbertura,
        e?.horarioFechamento,
        e?.endereco
      ]);

  @override
  bool isValidKey(Object? o) => o is LocalDescarteRecord;
}

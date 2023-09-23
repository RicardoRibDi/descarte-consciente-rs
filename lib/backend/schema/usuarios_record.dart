import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuariosRecord extends FirestoreRecord {
  UsuariosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "senha" field.
  String? _senha;
  String get senha => _senha ?? '';
  bool hasSenha() => _senha != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "tipoDeUsuario" field.
  String? _tipoDeUsuario;
  String get tipoDeUsuario => _tipoDeUsuario ?? '';
  bool hasTipoDeUsuario() => _tipoDeUsuario != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "analiseProprietario" field.
  bool? _analiseProprietario;
  bool get analiseProprietario => _analiseProprietario ?? false;
  bool hasAnaliseProprietario() => _analiseProprietario != null;

  // "localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  bool hasLocalizacao() => _localizacao != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _senha = snapshotData['senha'] as String?;
    _nome = snapshotData['nome'] as String?;
    _endereco = snapshotData['endereco'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _tipoDeUsuario = snapshotData['tipoDeUsuario'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _analiseProprietario = snapshotData['analiseProprietario'] as bool?;
    _localizacao = snapshotData['localizacao'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usuarios');

  static Stream<UsuariosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsuariosRecord.fromSnapshot(s));

  static Future<UsuariosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsuariosRecord.fromSnapshot(s));

  static UsuariosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsuariosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsuariosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsuariosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsuariosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsuariosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsuariosRecordData({
  String? email,
  String? senha,
  String? nome,
  String? endereco,
  String? telefone,
  String? tipoDeUsuario,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? analiseProprietario,
  LatLng? localizacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'senha': senha,
      'nome': nome,
      'endereco': endereco,
      'telefone': telefone,
      'tipoDeUsuario': tipoDeUsuario,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'analiseProprietario': analiseProprietario,
      'localizacao': localizacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsuariosRecordDocumentEquality implements Equality<UsuariosRecord> {
  const UsuariosRecordDocumentEquality();

  @override
  bool equals(UsuariosRecord? e1, UsuariosRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.senha == e2?.senha &&
        e1?.nome == e2?.nome &&
        e1?.endereco == e2?.endereco &&
        e1?.telefone == e2?.telefone &&
        e1?.tipoDeUsuario == e2?.tipoDeUsuario &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.analiseProprietario == e2?.analiseProprietario &&
        e1?.localizacao == e2?.localizacao;
  }

  @override
  int hash(UsuariosRecord? e) => const ListEquality().hash([
        e?.email,
        e?.senha,
        e?.nome,
        e?.endereco,
        e?.telefone,
        e?.tipoDeUsuario,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.analiseProprietario,
        e?.localizacao
      ]);

  @override
  bool isValidKey(Object? o) => o is UsuariosRecord;
}

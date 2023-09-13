import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserSummaryRecord extends FirestoreRecord {
  UserSummaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pack_succes" field.
  int? _packSucces;
  int get packSucces => _packSucces ?? 0;
  bool hasPackSucces() => _packSucces != null;

  // "pack_cancel" field.
  int? _packCancel;
  int get packCancel => _packCancel ?? 0;
  bool hasPackCancel() => _packCancel != null;

  // "pack_progress" field.
  int? _packProgress;
  int get packProgress => _packProgress ?? 0;
  bool hasPackProgress() => _packProgress != null;

  // "money_ready" field.
  double? _moneyReady;
  double get moneyReady => _moneyReady ?? 0.0;
  bool hasMoneyReady() => _moneyReady != null;

  // "money_progress" field.
  double? _moneyProgress;
  double get moneyProgress => _moneyProgress ?? 0.0;
  bool hasMoneyProgress() => _moneyProgress != null;

  // "money_handed" field.
  double? _moneyHanded;
  double get moneyHanded => _moneyHanded ?? 0.0;
  bool hasMoneyHanded() => _moneyHanded != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _packSucces = castToType<int>(snapshotData['pack_succes']);
    _packCancel = castToType<int>(snapshotData['pack_cancel']);
    _packProgress = castToType<int>(snapshotData['pack_progress']);
    _moneyReady = castToType<double>(snapshotData['money_ready']);
    _moneyProgress = castToType<double>(snapshotData['money_progress']);
    _moneyHanded = castToType<double>(snapshotData['money_handed']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_summary')
          : FirebaseFirestore.instance.collectionGroup('user_summary');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_summary').doc();

  static Stream<UserSummaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserSummaryRecord.fromSnapshot(s));

  static Future<UserSummaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserSummaryRecord.fromSnapshot(s));

  static UserSummaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserSummaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserSummaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserSummaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserSummaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserSummaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserSummaryRecordData({
  int? packSucces,
  int? packCancel,
  int? packProgress,
  double? moneyReady,
  double? moneyProgress,
  double? moneyHanded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pack_succes': packSucces,
      'pack_cancel': packCancel,
      'pack_progress': packProgress,
      'money_ready': moneyReady,
      'money_progress': moneyProgress,
      'money_handed': moneyHanded,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserSummaryRecordDocumentEquality implements Equality<UserSummaryRecord> {
  const UserSummaryRecordDocumentEquality();

  @override
  bool equals(UserSummaryRecord? e1, UserSummaryRecord? e2) {
    return e1?.packSucces == e2?.packSucces &&
        e1?.packCancel == e2?.packCancel &&
        e1?.packProgress == e2?.packProgress &&
        e1?.moneyReady == e2?.moneyReady &&
        e1?.moneyProgress == e2?.moneyProgress &&
        e1?.moneyHanded == e2?.moneyHanded;
  }

  @override
  int hash(UserSummaryRecord? e) => const ListEquality().hash([
        e?.packSucces,
        e?.packCancel,
        e?.packProgress,
        e?.moneyReady,
        e?.moneyProgress,
        e?.moneyHanded
      ]);

  @override
  bool isValidKey(Object? o) => o is UserSummaryRecord;
}

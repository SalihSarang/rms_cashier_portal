import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class ProfileRemoteDataSource {
  Future<void> updateLastActive(String uid, DateTime lastActive);
  Future<void> updateShiftStatus(String uid, String status);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore _firestore;

  ProfileRemoteDataSourceImpl({required FirebaseFirestore firestore})
    : _firestore = firestore;

  @override
  Future<void> updateLastActive(String uid, DateTime lastActive) async {
    await _firestore.collection(StaffDbConstants.staff).doc(uid).update({
      'lastActive': lastActive.millisecondsSinceEpoch,
    });
  }

  @override
  Future<void> updateShiftStatus(String uid, String status) async {
    await _firestore.collection(StaffDbConstants.staff).doc(uid).update({
      'status': status,
    });
  }
}

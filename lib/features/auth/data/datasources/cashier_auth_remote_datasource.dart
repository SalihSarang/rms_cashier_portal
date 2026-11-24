import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class CashierAuthRemoteDataSource {
  Future<StaffModel?> signIn(String email, String password);
  Future<StaffModel?> signInAsDemoCashier({String? sessionCode});
  Future<void> signOut();
  Future<StaffModel?> getCurrentCashier();
}

class CashierAuthRemoteDataSourceImpl implements CashierAuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  CashierAuthRemoteDataSourceImpl({
    required this.auth,
    required this.firestore,
  });

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    try {
      log('Attempting to sign in cashier with email: $email');

      if (DemoConfig.isDemoEmail(email)) {
        return await signInAsDemoCashier();
      }

      await auth.signInWithEmailAndPassword(email: email, password: password);
      final cashier = await getCurrentCashier();
      if (cashier == null) {
        log('User is not a valid cashier. Signing out immediately.');
        await auth.signOut();
        throw Exception('User is not a valid cashier.');
      }
      log('Cashier signed in successfully: ${cashier.name}');
      return cashier;
    } catch (e) {
      log('Error signing in cashier: $e');
      rethrow;
    }
  }

  @override
  Future<StaffModel?> signInAsDemoCashier({String? sessionCode}) async {
    try {
      log('Signing in as Demo Cashier (session: $sessionCode)');
      await DemoAuthBootstrapService.signInOrBootstrapStaffDemo(
        DemoConfig.cashier,
        sessionCode: sessionCode,
        auth: auth,
        firestore: firestore,
      );
      final cashier = await getCurrentCashier();
      if (cashier == null) {
        throw Exception('Failed to synchronize demo cashier profile.');
      }
      return cashier;
    } catch (e) {
      log('Demo Cashier sign-in error: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    log('Signing out current cashier');
    await DemoSessionManager.clearSession();
    await auth.signOut();
  }

  @override
  Future<StaffModel?> getCurrentCashier() async {
    final user = auth.currentUser;

    if (user == null) {
      log('No authenticated user found');
      return null;
    }
    log('Fetching details for user UID: ${user.uid}');
    final docSnapshot = await firestore
        .rmsCollection(StaffDbConstants.staff)
        .doc(user.uid)
        .get();

    if (!docSnapshot.exists || docSnapshot.data() == null) {
      log('Cashier document does not exist for UID: ${user.uid}');
      return null;
    }

    final staff = StaffModel.fromMap(docSnapshot.data()!, docSnapshot.id);

    // Ensure the user is actually a cashier (billing role)
    if (staff.role != UserRole.billing) {
      log('Authenticated user is not a cashier. Real role: ${staff.role.name}');
      return null;
    }

    log('Cashier document retrieved successfully');
    return staff;
  }
}

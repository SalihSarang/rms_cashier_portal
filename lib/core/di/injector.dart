import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:cashier_portal/core/di/cashier_auth_di.dart';
import 'package:cashier_portal/core/di/billing_di.dart';
import 'package:cashier_portal/core/di/profile_di.dart';

final getIt = GetIt.instance;

void setupDI() {
  //Firebase
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );


  //Cashier Auth DI
  cashierAuthDI();

  //Billing Feature DI
  billingDI();

  //Profile Feature DI
  profileDI();
}

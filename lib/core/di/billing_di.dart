import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cashier_portal/core/di/injector.dart';
import 'package:cashier_portal/features/billing/data/datasources/billing_remote_datasource.dart';
import 'package:cashier_portal/features/billing/data/repositories/billing_repository_impl.dart';
import 'package:cashier_portal/features/billing/domain/repositories/billing_repository.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_bloc.dart';

/// Dependency Injection setup for the Billing Feature.
void billingDI() {
  // Data Sources
  getIt.registerLazySingleton<BillingRemoteDataSource>(
    () => BillingRemoteDataSourceImpl(getIt<FirebaseFirestore>()),
  );

  // Repositories
  getIt.registerLazySingleton<BillingRepository>(
    () => BillingRepositoryImpl(getIt<BillingRemoteDataSource>()),
  );

  // Blocs
  getIt.registerFactory<BillingBloc>(
    () => BillingBloc(repository: getIt<BillingRepository>()),
  );
}

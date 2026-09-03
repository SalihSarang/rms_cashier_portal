import 'package:firebase_auth/firebase_auth.dart';
import 'package:cashier_portal/core/di/injector.dart';
import 'package:cashier_portal/features/auth/data/datasources/cashier_auth_remote_datasource.dart';
import 'package:cashier_portal/features/auth/data/repositories/cashier_auth_repo_impl.dart';
import 'package:cashier_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:cashier_portal/features/auth/domain/usecases/check_auth_status.dart';
import 'package:cashier_portal/features/auth/domain/usecases/sign_in_cashier.dart';
import 'package:cashier_portal/features/auth/domain/usecases/sign_out_cashier.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';

//Cashier Auth DI
void cashierAuthDI() {
  //Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data Sources
  getIt.registerLazySingleton<CashierAuthRemoteDataSource>(
    () => CashierAuthRemoteDataSourceImpl(auth: getIt(), firestore: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => CashierAuthRepoImpl(
      remoteDataSource: getIt<CashierAuthRemoteDataSource>(),
    ),
  );

  //Auth Usecases
  getIt.registerLazySingleton(() => SignInCashier(getIt()));
  getIt.registerLazySingleton(() => SignOutCashier(getIt()));
  getIt.registerLazySingleton(() => CheckAuthStatus(getIt()));

  //Register Bloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInCashier: getIt(),
      signOutCashier: getIt(),
      checkAuthStatus: getIt(),
    ),
  );
}

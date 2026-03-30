import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cashier_portal/core/di/injector.dart';
import 'package:cashier_portal/features/home/data/datasources/home_remote_datasource.dart';
import 'package:cashier_portal/features/home/data/repositories/home_repository_impl.dart';
import 'package:cashier_portal/features/home/domain/repositories/home_repository.dart';
import 'package:cashier_portal/features/home/domain/usecases/update_last_active_usecase.dart';
import 'package:cashier_portal/features/home/presentation/bloc/shift_bloc.dart';

// Home Feature DI
void homeDI() {
  // Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );

  // Repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  // UseCases
  getIt.registerLazySingleton(
    () => UpdateLastActiveUseCase(getIt<HomeRepository>()),
  );

  // Blocs
  getIt.registerFactory<ShiftBloc>(
    () => ShiftBloc(updateLastActiveUseCase: getIt<UpdateLastActiveUseCase>()),
  );
}

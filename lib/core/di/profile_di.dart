import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cashier_portal/core/di/injector.dart';
import 'package:cashier_portal/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:cashier_portal/features/profile/domain/repositories/profile_repository.dart';
import 'package:cashier_portal/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:cashier_portal/features/profile/domain/usecases/update_last_active_usecase.dart';
import 'package:cashier_portal/features/profile/domain/usecases/pause_shift_usecase.dart';
import 'package:cashier_portal/features/profile/domain/usecases/resume_shift_usecase.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';

/// Dependency Injection setup for the Profile Feature.
void profileDI() {
  // Data Sources
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );

  // Repositories
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton(
    () => UpdateLastActiveUseCase(getIt<ProfileRepository>()),
  );
  getIt.registerLazySingleton(
    () => PauseShiftUseCase(getIt<ProfileRepository>()),
  );
  getIt.registerLazySingleton(
    () => ResumeShiftUseCase(getIt<ProfileRepository>()),
  );

  // Blocs
  getIt.registerFactory<ShiftBloc>(
    () => ShiftBloc(
      updateLastActiveUseCase: getIt<UpdateLastActiveUseCase>(),
      pauseShiftUseCase: getIt<PauseShiftUseCase>(),
      resumeShiftUseCase: getIt<ResumeShiftUseCase>(),
    ),
  );
}

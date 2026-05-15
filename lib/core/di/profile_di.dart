import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cashier_portal/core/di/injector.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

/// Dependency Injection setup for the Profile Feature.
void profileDI() {
  getIt.registerLazySingleton<ShiftRepository>(
    () => FirestoreShiftRepository(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton(
    () => GetCurrentShiftSession(getIt<ShiftRepository>()),
  );
  getIt.registerLazySingleton(() => GetShiftHistory(getIt<ShiftRepository>()));
  getIt.registerLazySingleton(() => StartShift(getIt<ShiftRepository>()));
  getIt.registerLazySingleton(() => PauseShift(getIt<ShiftRepository>()));
  getIt.registerLazySingleton(() => ResumeShift(getIt<ShiftRepository>()));
  getIt.registerLazySingleton(() => EndShift(getIt<ShiftRepository>()));

  // Blocs
  getIt.registerFactory<ShiftBloc>(
    () => ShiftBloc(
      getCurrentShiftSession: getIt<GetCurrentShiftSession>(),
      getShiftHistory: getIt<GetShiftHistory>(),
      startShift: getIt<StartShift>(),
      pauseShift: getIt<PauseShift>(),
      resumeShift: getIt<ResumeShift>(),
      endShift: getIt<EndShift>(),
    ),
  );
}

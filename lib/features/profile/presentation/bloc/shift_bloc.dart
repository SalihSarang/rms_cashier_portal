import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/profile/domain/usecases/update_last_active_usecase.dart';
import 'package:cashier_portal/features/profile/domain/usecases/pause_shift_usecase.dart';
import 'package:cashier_portal/features/profile/domain/usecases/resume_shift_usecase.dart';
import 'shift_event.dart';
import 'shift_state.dart';

class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final UpdateLastActiveUseCase updateLastActiveUseCase;
  final PauseShiftUseCase pauseShiftUseCase;
  final ResumeShiftUseCase resumeShiftUseCase;

  ShiftBloc({
    required this.updateLastActiveUseCase,
    required this.pauseShiftUseCase,
    required this.resumeShiftUseCase,
  }) : super(ShiftInitial()) {
    on<StartShiftEvent>(
      (event, emit) => _handleShiftUpdate(event.uid, true, emit),
    );
    on<EndShiftEvent>(
      (event, emit) => _handleShiftUpdate(event.uid, false, emit),
    );
    on<PauseShiftEvent>(_onPauseShift);
    on<ResumeShiftEvent>(_onResumeShift);
  }

  Future<void> _handleShiftUpdate(
    String uid,
    bool isStarting,
    Emitter<ShiftState> emit,
  ) async {
    emit(ShiftLoading());
    try {
      final now = DateTime.now();
      await updateLastActiveUseCase(uid, now);
      if (isStarting) {
        emit(ShiftActive(now));
      } else {
        emit(ShiftEnded(now));
      }
    } catch (e) {
      emit(ShiftError(e.toString()));
    }
  }

  Future<void> _onPauseShift(
    PauseShiftEvent event,
    Emitter<ShiftState> emit,
  ) async {
    final currentState = state;
    if (currentState is ShiftActive) {
      emit(ShiftLoading());
      try {
        await pauseShiftUseCase(event.uid);
        emit(ShiftPaused(currentState.startTime));
      } catch (e) {
        emit(ShiftError(e.toString()));
      }
    }
  }

  Future<void> _onResumeShift(
    ResumeShiftEvent event,
    Emitter<ShiftState> emit,
  ) async {
    final currentState = state;
    if (currentState is ShiftPaused) {
      emit(ShiftLoading());
      try {
        await resumeShiftUseCase(event.uid);
        emit(ShiftActive(currentState.startTime));
      } catch (e) {
        emit(ShiftError(e.toString()));
      }
    }
  }
}

abstract class ShiftEvent {}

class StartShiftEvent extends ShiftEvent {
  final String uid;

  StartShiftEvent(this.uid);
}

class EndShiftEvent extends ShiftEvent {
  final String uid;

  EndShiftEvent(this.uid);
}

class PauseShiftEvent extends ShiftEvent {
  final String uid;

  PauseShiftEvent(this.uid);
}

class ResumeShiftEvent extends ShiftEvent {
  final String uid;

  ResumeShiftEvent(this.uid);
}

import 'challenge_slot.dart';

class WeeklyChallenge {
  final String weekId;
  final List<ChallengeSlot> slots;

  WeeklyChallenge({
    required this.weekId,
    required this.slots,
  });
}

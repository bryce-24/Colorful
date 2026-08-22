import 'package:flutter/material.dart';
import '../models/challenge_slot.dart';
import '../models/weekly_challenge.dart';

final WeeklyChallenge currentChallenge = WeeklyChallenge(
  weekId: '2026_week_32',

  slots: [
    ChallengeSlot(
      colors: [
        Colors.red,
      ],
    ),

    ChallengeSlot(
      colors: [
        Colors.blue,
      ],
    ),

    ChallengeSlot(
      colors: [
        Colors.green,
      ],
    ),

    ChallengeSlot(
      colors: [
        Colors.yellow,
      ],
    ),

    ChallengeSlot(
      colors: [
        Colors.purple,
      ],
    ),

    ChallengeSlot(
      colors: [
        Colors.orange,
      ],
    ),
  ],
);

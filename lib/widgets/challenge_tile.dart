import 'package:flutter/material.dart';
import '../models/challenge_slot.dart';

class ChallengeTile extends StatelessWidget {
  final ChallengeSlot slot;

  const ChallengeTile({
    super.key,
    required this.slot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: _buildGradient(),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  LinearGradient _buildGradient() {
    if (slot.colors.length == 1) {
      return LinearGradient(
        colors: [
          slot.colors.first,
          slot.colors.first,
        ],
      );
    }

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        slot.colors[0],
        slot.colors[0],
        slot.colors[1],
        slot.colors[1],
      ],
      stops: const [
        0.0,
        0.5,
        0.5,
        1.0,
      ],
    );
  }
}

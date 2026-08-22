import 'package:flutter/material.dart';
import '../data/current_challenge.dart';
import '../widgets/challenge_tile.dart';
import '../widgets/countdown_timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          itemCount: currentChallenge.slots.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemBuilder: (context, index) {
            final slot = currentChallenge.slots[index];
            return ChallengeTile(slot: slot);
          },
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CountdownTimer(),
        ),
      ],
    );
  }
}

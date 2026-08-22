import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateCountdown();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateCountdown(),
    );
  }

  void _updateCountdown() {
    final now = tz.TZDateTime.now(tz.local);
    DateTime nextMonday = now;

    while (nextMonday.weekday != DateTime.monday) {
      nextMonday = nextMonday.add(const Duration(days: 1));
    }

    final nextReset = tz.TZDateTime(
      tz.local,
      nextMonday.year,
      nextMonday.month,
      nextMonday.day,
      1,
    );

    final resetTime = nextReset.isAfter(now)
        ? nextReset
        : nextReset.add(const Duration(days: 7));

    setState(() {
      _remaining = resetTime.difference(now);
    });
  }

  String _formatDuration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${days}d ${hours}h ${minutes}m ${seconds}s';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'New colors in: ${_formatDuration(_remaining)}',
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}

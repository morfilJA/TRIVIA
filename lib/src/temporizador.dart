import 'dart:async';
import 'package:flutter/material.dart';

class QuestionTimer extends StatefulWidget {
  final VoidCallback onTimeUp;

  const QuestionTimer({super.key, required this.onTimeUp});

  @override
  State<QuestionTimer> createState() => _QuestionTimerState();
}

class _QuestionTimerState extends State<QuestionTimer> {
  Timer? _timer;
  int _timeLeft = 30;

  void startTimer() {
    // Verifica si el temporizador ya está corriendo
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_timeLeft > 0) {
          setState(() {
            _timeLeft--;
          });
        } else {
          _timer?.cancel();
          widget.onTimeUp(); // Notifica cuando el tiempo se acaba
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Asegúrate de cancelar el temporizador al salir
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Inicia el temporizador una sola vez al crear el widget
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Tiempo restante: $_timeLeft segundos",
      style: const TextStyle(fontSize: 18, color: Colors.red),
    );
  }
}

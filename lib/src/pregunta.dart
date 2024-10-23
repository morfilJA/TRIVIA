// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:trivia/src/puntuacion_final.dart';
// import 'modelo_de_datos.dart';

// class PreguntaScreen extends StatefulWidget {
//   final List<Player> players;
//   final int currentPlayerIndex;

//   const PreguntaScreen(
//       {super.key, required this.players, required this.currentPlayerIndex});

//   @override
//   State<PreguntaScreen> createState() => _PreguntaScreenState();
// }

// class _PreguntaScreenState extends State<PreguntaScreen> {
//   int _currentQuestionIndex = 0;
//   int _selectedOptionIndex = -1;
//   bool _answered = false;
//   int _timeLeft = 30;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     // Asegurarnos que el widget está completamente montado antes de mostrar el diálogo
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showWelcomeDialog();
//     });
//   }

//   // Mostrar el diálogo de bienvenida
//   void _showWelcomeDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible:
//           false, // Evitar que el usuario cierre el diálogo manualmente
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("¡Vamos!"),
//           content: Text(
//               "Es tu turno, ${widget.players[widget.currentPlayerIndex].name}!"),
//         );
//       },
//     );

//     // Espera 2 segundos antes de cerrar el diálogo e iniciar el juego
//     Future.delayed(const Duration(seconds: 10), () {
//       Navigator.of(context).pop(); // Cierra el diálogo
//       startTimer(); // Inicia el temporizador del juego
//     });
//   }

//   void startTimer() {
//     _timer?.cancel(); // Cancela cualquier temporizador activo
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_timeLeft > 0) {
//         if (mounted) {
//           setState(() {
//             _timeLeft--;
//           });
//         }
//       } else {
//         _timer?.cancel();
//         _showNextQuestion(); // Pasar a la siguiente pregunta automáticamente
//       }
//     });
//   }

//   void _showNextQuestion() {
//     if (mounted) {
//       setState(() {
//         _answered = false;
//         _selectedOptionIndex = -1;
//         _timeLeft = 30; // Reiniciar el temporizador

//         if (_currentQuestionIndex < questions.length - 1) {
//           // Todavía hay más preguntas para este jugador
//           _currentQuestionIndex++;
//           startTimer();
//         } else {
//           // Si no quedan más preguntas, pasamos al siguiente jugador o mostramos la puntuación
//           _nextPlayerOrScoreboard();
//         }
//       });
//     }
//   }

//   void _nextPlayerOrScoreboard() {
//     _timer
//         ?.cancel(); // Aseguramos que el temporizador se cancele al cambiar de pantalla

//     if (widget.currentPlayerIndex < widget.players.length - 1) {
//       // Hay más jugadores, pasamos al siguiente jugador
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PreguntaScreen(
//             players: widget.players,
//             currentPlayerIndex: widget.currentPlayerIndex + 1,
//           ),
//         ),
//       );
//     } else {
//       // No quedan más jugadores, mostramos la puntuación
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ScoreScreen(players: widget.players),
//         ),
//       );
//     }
//   }

//   void _answerQuestion(int index) {
//     if (!_answered) {
//       setState(() {
//         _answered = true;
//         _selectedOptionIndex = index;
//         if (questions[_currentQuestionIndex].correctOptionIndex == index) {
//           // Si la respuesta es correcta, sumamos 1 punto al jugador actual
//           widget.players[widget.currentPlayerIndex].score++;
//         }
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _timer?.cancel(); // Cancelamos el temporizador cuando la pantalla se cierra
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Question currentQuestion = questions[_currentQuestionIndex];

//     return WillPopScope(
//       onWillPop: () async => true, // Desactiva el botón de ir atrás
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//               'Pregunta ${_currentQuestionIndex + 1}/${questions.length} - Jugador: ${widget.players[widget.currentPlayerIndex].name}'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Muestra el temporizador
//               Text(
//                 "Tiempo restante: $_timeLeft segundos",
//                 style: const TextStyle(fontSize: 18, color: Colors.red),
//               ),
//               const SizedBox(height: 20),

//               // Muestra la imagen de la pregunta
//               SizedBox(
//                 width: 400, // Ancho de la imagen
//                 height: 400, // Alto de la imagen
//                 child: Image.asset(
//                   currentQuestion.imagePath,
//                   fit: BoxFit.cover, // Ajusta la imagen al espacio
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Muestra el texto de la pregunta
//               Text(
//                 currentQuestion.questionText,
//                 style:
//                     const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),

//               // Muestra las opciones
//               Column(
//                 children:
//                     List.generate(currentQuestion.options.length, (index) {
//                   return ListTile(
//                     title: Text(currentQuestion.options[index]),
//                     leading: Radio(
//                       value: index,
//                       groupValue: _selectedOptionIndex,
//                       onChanged:
//                           _answered ? null : (value) => _answerQuestion(index),
//                     ),
//                   );
//                 }),
//               ),
//               const SizedBox(height: 20),

//               // Botón para pasar a la siguiente pregunta
//               ElevatedButton(
//                 onPressed: _answered ? _showNextQuestion : null,
//                 child: const Text("Siguiente pregunta"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////-------------------

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivia/src/puntuacion_final.dart';
import 'modelo_de_datos.dart';

class PreguntaScreen extends StatefulWidget {
  final List<Player> players;
  final int currentPlayerIndex;

  const PreguntaScreen(
      {super.key, required this.players, required this.currentPlayerIndex});

  @override
  State<PreguntaScreen> createState() => _PreguntaScreenState();
}

class _PreguntaScreenState extends State<PreguntaScreen> {
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  bool _answered = false;
  int _timeLeft = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog();
    });
  }

  // Mostrar el diálogo de bienvenida
  void _showWelcomeDialog() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Evitar que el usuario cierre el diálogo manualmente
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¡Vamos!"),
          content: Text(
              "Es tu turno, ${widget.players[widget.currentPlayerIndex].name}!"),
        );
      },
    );

    // Espera 2 segundos antes de cerrar el diálogo e iniciar el juego
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Cierra el diálogo
      startTimer(); // Inicia el temporizador del juego
    });
  }

  void startTimer() {
    _timer?.cancel(); // Cancela cualquier temporizador activo
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        if (mounted) {
          setState(() {
            _timeLeft--;
          });
        }
      } else {
        _timer?.cancel();
        _showNextQuestion(); // Pasar a la siguiente pregunta automáticamente
      }
    });
  }

  void _showNextQuestion() {
    if (mounted) {
      setState(() {
        _answered = false;
        _selectedOptionIndex = -1;
        _timeLeft = 30; // Reiniciar el temporizador

        if (_currentQuestionIndex < questions.length - 1) {
          _currentQuestionIndex++;
          startTimer();
        } else {
          _nextPlayerOrScoreboard();
        }
      });
    }
  }

  void _nextPlayerOrScoreboard() {
    _timer
        ?.cancel(); // Aseguramos que el temporizador se cancele al cambiar de pantalla

    if (widget.currentPlayerIndex < widget.players.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PreguntaScreen(
            players: widget.players,
            currentPlayerIndex: widget.currentPlayerIndex + 1,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(players: widget.players),
        ),
      );
    }
  }

  void _answerQuestion(int index) {
    if (!_answered) {
      setState(() {
        _answered = true;
        _selectedOptionIndex = index;
        if (questions[_currentQuestionIndex].correctOptionIndex == index) {
          widget.players[widget.currentPlayerIndex].score++;
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelamos el temporizador cuando la pantalla se cierra
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[_currentQuestionIndex];

    return WillPopScope(
      onWillPop: () async => false, // Desactiva el botón de ir atrás
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
              'Pregunta ${_currentQuestionIndex + 1}/${questions.length} - Jugador: ${widget.players[widget.currentPlayerIndex].name}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Muestra el temporizador
              Text(
                "Tiempo restante: $_timeLeft segundos",
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
              const SizedBox(height: 20),

              // Muestra la imagen de la pregunta
              SizedBox(
                width: 400, // Ancho de la imagen
                height: 400, // Alto de la imagen
                child: Image.asset(
                  currentQuestion.imagePath,
                  fit: BoxFit.cover, // Ajusta la imagen al espacio
                ),
              ),
              const SizedBox(height: 20),

              // Muestra el texto de la pregunta
              Text(
                currentQuestion.questionText,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Muestra las opciones dentro de una tarjeta (Card)
              Column(
                children:
                    List.generate(currentQuestion.options.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (!_answered) {
                        _answerQuestion(index);
                      }
                    },
                    child: Card(
                      color: _selectedOptionIndex == index
                          ? Colors
                              .green // Cambia el color a verde si está seleccionada
                          : Colors.white,
                      child: ListTile(
                        title: Text(currentQuestion.options[index]),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              // Botón para pasar a la siguiente pregunta
              ElevatedButton(
                onPressed: _answered ? _showNextQuestion : null,
                child: const Text("Siguiente pregunta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
///////
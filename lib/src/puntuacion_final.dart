// import 'package:flutter/material.dart';
// import 'modelo_de_datos.dart';

// class ScoreScreen extends StatelessWidget {
//   final List<Player> players;

//   const ScoreScreen({super.key, required this.players});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Puntuación Final'),
//       ),
//       body: ListView.builder(
//         itemCount: players.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(players[index].name),
//             subtitle: Text("Puntos: ${players[index].score}"),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'modelo_de_datos.dart';

class ScoreScreen extends StatelessWidget {
  final List<Player> players;

  const ScoreScreen({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    // Ordenar a los jugadores por puntaje de mayor a menor
    List<Player> sortedPlayers = List.from(players);
    sortedPlayers.sort((a, b) => b.score.compareTo(a.score));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Puntuación Final'),
      ),
      body: Center(
        // Centrar el contenido
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0), // Añadir un poco de padding
          itemCount: sortedPlayers.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5, // Añadir sombra para destacar las tarjetas
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}° Lugar: ${sortedPlayers[index].name}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Puntos: ${sortedPlayers[index].score}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

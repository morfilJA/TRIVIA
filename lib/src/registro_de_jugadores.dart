import 'package:flutter/material.dart';
import 'modelo_de_datos.dart';
import 'pregunta.dart';

class PlayerRegistrationScreen extends StatefulWidget {
  const PlayerRegistrationScreen({super.key});

  @override
  State<PlayerRegistrationScreen> createState() =>
      _PlayerRegistrationScreenState();
}

class _PlayerRegistrationScreenState extends State<PlayerRegistrationScreen> {
  final List<Player> players = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  void _addPlayer() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        players.add(Player(name: _nameController.text));
      });
      _nameController.clear();
    }
  }

  void _removePlayer(int index) {
    setState(() {
      players.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de Jugadores"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          // Hace que la pantalla sea desplazable
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centra verticalmente
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300, // Especifica el ancho que desees
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                          labelText: "Nombre del jugador o del equipo"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa un nombre';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _addPlayer,
                    child: const Text("Agregar Jugador"),
                  ),
                  const SizedBox(height: 20),

                  // Tabla de jugadores
                  if (players.isNotEmpty)
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Nombre del Jugador')),
                        DataColumn(label: Text('Acción')),
                      ],
                      rows: List.generate(players.length, (index) {
                        return DataRow(
                          cells: [
                            DataCell(Text(players[index].name)),
                            DataCell(
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _removePlayer(index),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Botón para iniciar el juego
                  ElevatedButton(
                    onPressed: players.isNotEmpty
                        ? () {
                            // Navega a la pantalla de preguntas al presionar el botón
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PreguntaScreen(
                                  players: players,
                                  currentPlayerIndex:
                                      0, // Comenzamos con el primer jugador
                                ),
                              ),
                            );
                          }
                        : null, // Deshabilitar si no hay jugadores
                    child: const Text("Iniciar Juego"),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final String imagePath;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.imagePath,
  });
}

class Player {
  String name;
  int score = 0;

  Player({required this.name});
}

// Lista de preguntas
List<Question> questions = [
  Question(
    questionText: "¿Qué significa la luz roja?",
    options: ["Detenerse", "Cruzar rápido", "Acelerar", "Esperar"],
    correctOptionIndex: 0,
    imagePath: "assets/luz_roja.png",
  ),
  Question(
    questionText: "¿Quién debe usar el cinturón?",
    options: [
      "Nadie",
      "Solo el conductor",
      "Solo los niños",
      "Todos los pasajeros"
    ],
    correctOptionIndex: 3,
    imagePath: "assets/cinturon.png",
  ),
  Question(
    questionText: "¿Dónde se debe caminar?",
    options: [
      "En la ruta",
      "En la vereda",
      "En el césped",
      "En el medio de la calle"
    ],
    correctOptionIndex: 1,
    imagePath: "assets/vereda.png",
  ),
  Question(
    questionText: "Los ciclistas deben usar casco",
    options: ["Verdadero", "Falso"],
    correctOptionIndex: 0,
    imagePath: "assets/4.jpg",
  ),
  Question(
    questionText: "¿Cómo es la señal de alto?",
    options: ["Un círculo", "Un triángulo", "Un cuadrado", "Un octágono"],
    correctOptionIndex: 3,
    imagePath: "assets/senal_alto.png",
  ),
  Question(
    questionText: "¿Qué hacer al cruzar?",
    options: [
      "Mirar a los lados",
      "Correr rápido",
      "No mirar",
      "Hablar por teléfono"
    ],
    correctOptionIndex: 0,
    imagePath: "assets/cruzar.png",
  ),
  Question(
    questionText: "Los peatones tienen prioridad.",
    options: ["Verdadero", "Falso"],
    correctOptionIndex: 0,
    imagePath: "assets/peaton.png",
  ),
  Question(
    questionText: "¿Qué hacer si el semaforo esta en amarillo?",
    options: ["Acelerar", "Cruzar rápido", "Detenerse", "Ignorarlo"],
    correctOptionIndex: 2,
    imagePath: "assets/semaforo_amarillo.jpg",
  ),
  Question(
    questionText: "Los niños pueden cruzar sin mirar.",
    options: ["Verdadero", "Falso"],
    correctOptionIndex: 1,
    imagePath: "assets/ninos_cruzando.jpg",
  ),
  Question(
    questionText: "¿Cómo se debe usar el teléfono al conducir?",
    options: [
      "Usarlo siempre",
      "Con manos libres",
      "No usarlo",
      "Solo en semáforos"
    ],
    correctOptionIndex: 2,
    imagePath: "assets/10.jpg",
  ),
  Question(
    questionText: "Los conductores deben ceder el paso a los ciclistas.",
    options: ["Verdadero", "Falso"],
    correctOptionIndex: 0,
    imagePath: "assets/ciclistas.jpg",
  ),
  Question(
    questionText: "Los semáforos son solo para coches.",
    options: ["Verdadero", "Falso"],
    correctOptionIndex: 1,
    imagePath: "assets/peaton_semaforo.jpg",
  ),
  Question(
    questionText: "¿Qué hacer si hay un accidente?",
    options: ["Ignorarlo", "Culpar a otros", "Tomar fotos", "Llamar al 911"],
    correctOptionIndex: 3,
    imagePath: "assets/accidente.jpg",
  ),
  Question(
    questionText: "Los vehículos deben detenerse en un paso peatonal.",
    options: ["Verdadero", "Falso"],
    correctOptionIndex: 0,
    imagePath: "assets/auto_senda.jpg",
  ),
];

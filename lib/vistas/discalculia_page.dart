import 'package:flutter/material.dart';

class DiscalculiaPage extends StatelessWidget {
  const DiscalculiaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 230, 254),
        title: Image.asset('assets/sirema.png', scale: 4),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: [
                  SizedBox(
                    width: 800,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          color: Colors.white,
                          child: Image.asset(
                            'assets/discalculia.png',
                            scale: 2,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 154, 71, 255),
                                  width: 2,
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'La discalculia es un trastorno del aprendizaje en el que impera la dificultad para realizar habilidades numéricas, entender cantidades o identificar los números, por ejemplo, cual es mayor o menor, cuál número va primero y cuál le sigue, también se les complica hacer sumas de derecha a izquierda o de arriba hacia abajo, entre otras.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'Hay de dos tipos, la adquirida y la del desarrollo.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'La primera se presenta como consecuencia de una lesión cerebral y puede aparecer a cualquier edad.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'La segunda surge desde la infancia e inicia cuando los niños entran a preescolar y empiezan a trabajar con operaciones numéricas.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'Un niño con discalculia puede paparecer:',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '• Tener dificultad para reconocer números.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '• Tardarse más en aprender a contar.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '• Tener dificultad para conectar los símbolos numéricos (5) con sus palabras correspondientes (cinco).',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '• Tener dificultades para reconocer patrones y poner las cosas en orden.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '• Perder el hilo mientras cuenta.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '• Necesitar apoyos visuales, como los dedos, para ayudarse a contar.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -100,
                              top: -80,
                              child: Image.asset(
                                'assets/avionsito.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              left: -100,
                              bottom: -100,
                              child: Image.asset(
                                'assets/nino.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              right: -95,
                              bottom: -70,
                              child: Image.asset(
                                'assets/patito.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              left: -95,
                              top: -70,
                              child: Image.asset(
                                'assets/trex.png',
                                scale: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

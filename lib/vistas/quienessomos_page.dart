import 'package:flutter/material.dart';

class QuienesSomosPage extends StatelessWidget {
  const QuienesSomosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 250, 254),
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
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 800,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          color: Colors.white,
                          child: Image.asset(
                            'assets/quienes_somos.png',
                            scale: 1.8,
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
                                      const Color.fromARGB(255, 71, 218, 255),
                                  width: 2,
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bienvenidos a SIREMA, una empresa comprometida con el impulso educativo y el desarrollo de habilidades matemáticas en los niños de 7 a 8 años o aquellos que cursan segundo de primaria. Nuestro principal objetivo es ofrecer una solución educativa de calidad que permita a los niños adquirir los fundamentos matemáticos de manera sólida y significativa.',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'En SIREMA, nos preocupamos no solo por el aprendizaje de las sumas y restas, sino también por inculcar valores positivos en nuestros usuarios, creemos que la educación es la base para construir un futuro mejor. Nuestro compromiso es brindar herramientas tecnológicas de calidad que potencie el aprendizaje de las matemáticas y promuevan el desarrollo integral de los niños, preparándolos para enfrentar los retos del mundo moderno.',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Estamos comprometidos con ofrecer productos que se adapten a las necesidades y habilidades individuales de cada niño, permitiéndoles avanzar a su propio ritmo y superar sus propios desafíos. Además, contamos con un sistema de seguimiento y evaluación que permita monitorear el progreso y brindar un apoyo personalizado.',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -100,
                              top: -80,
                              child: Image.asset(
                                'assets/lapicito.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              left: -95,
                              bottom: -70,
                              child: Image.asset(
                                'assets/avioneta.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              right: -95,
                              bottom: -70,
                              child: Image.asset(
                                'assets/cohete.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              left: -95,
                              top: -70,
                              child: Image.asset(
                                'assets/helicoptero.png',
                                scale: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

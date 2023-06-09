import 'package:flutter/material.dart';

class ObjetivoEnElServicio extends StatelessWidget {
  const ObjetivoEnElServicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 249, 230),
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
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          color: Colors.white,
                          child: Image.asset(
                            'assets/nuestro_servicio.png',
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
                                  color: const Color(0xffFFBD47),
                                  width: 2,
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• Motivar a la comunidad educativa en el manejo adecuado y provechoso de la página web como herramienta de apoyo a su conocimiento y vínculo de comunicación.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    '• Fortalecer el sentido de pertenencia de los estudiantes hacia la institución.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    '• Fomentar una red de apoyo a la comunidad y de intercambio de información entre la institución y la comunidad',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    '• Crear un portal web de fácil manejo y personalización, el cual pueda ser utilizado como recurso didáctico para la enseñanza. Realizar el diseño e implementación de las aplicaciones usuario/final y usuario/administrador, bajo los lineamientos en cuanto al diseño.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    '• Aprender funciones matemáticas básicas como sumas, restas.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -80,
                              top: -50,
                              child: Image.asset(
                                'assets/robot.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              left: -95,
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
                                'assets/tambor.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              left: -95,
                              top: -70,
                              child: Image.asset(
                                'assets/trompo.png',
                                scale: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
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

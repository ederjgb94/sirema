import 'package:flutter/material.dart';

class MisionVisionPage extends StatelessWidget {
  const MisionVisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 239, 230),
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
                            'assets/mision_vision.png',
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
                                      const Color.fromARGB(255, 255, 114, 71),
                                  width: 2,
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Misión: ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Nuestra misión en SIREMA es brindar a los niños de 7 a 8 años y a aquellos que cursan segundo de primaria un software de aprendizaje de sumas y restas que sea de calidad, interactivo y divertido. Nos esforzamos por ofrecer una herramienta educativa que promueva el desarrollo de habilidades matemáticas sólidas, al tiempo que inculca valores positivos y fomenta el crecimiento integral de los niños. Buscamos ser un aliado confiable para padres y educadores, proporcionando una experiencia de aprendizaje enriquecedora que prepare a los niños para enfrentar los desafíos del mundo moderno.',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'Visión: ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'En SIREMA, tenemos la visión de convertirnos en líderes en el desarrollo de software educativo para el aprendizaje de sumas y restas en niños de 7 a 8 años o segundo de primaria. Nos esforzamos por expandir nuestra plataforma para ofrecer una amplia gama de recursos y actividades interactivas que fortalezcan las habilidades matemáticas de los niños y les brinden una base sólida para su desarrollo académico. Aspiramos a ser una referencia en el campo de la educación digital, proporcionando herramientas eficaces que faciliten el reforzamiento de las matemáticas y contribuyan al éxito educativo de los niños.',
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
                                'assets/lapiz_servicio.png',
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
                                'assets/libro.png',
                                scale: 1,
                              ),
                            ),
                            Positioned(
                              left: -95,
                              top: -70,
                              child: Image.asset(
                                'assets/carrito.png',
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

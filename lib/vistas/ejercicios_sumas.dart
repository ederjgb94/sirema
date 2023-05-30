import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sirema/utilerias/pair.dart';
import 'package:text_to_speech/text_to_speech.dart';

class EjerciciosSumasPage extends StatefulWidget {
  const EjerciciosSumasPage({super.key});

  @override
  State<EjerciciosSumasPage> createState() => _EjerciciosSumasPageState();
}

class _EjerciciosSumasPageState extends State<EjerciciosSumasPage> {
  final Random random = Random();

  final List<String> imagenes = [
    'arbol',
    'buho',
    'caracol',
    'fresa',
    'lapiz',
    'libro',
    'mango',
    'manzana',
    'platano',
    'sandia',
    'zanahoria',
  ];

  final List<TextEditingController> respuestas =
      List.generate(10, (index) => TextEditingController());

  List<Pair> ejercicios = [];

  List<String> oraciones = [];

  List<List<int>> imgG1 = [];
  List<List<int>> imgG2 = [];

  bool verificar = false;

  @override
  void initState() {
    ejercicios = List.generate(10, (index) {
      int x = (random.nextInt(imagenes.length)) + 1;
      int y = (random.nextInt(imagenes.length)) + 1;

      imgG1.add(List.generate(x, (index) => random.nextInt(imagenes.length)));
      imgG2.add(List.generate(y, (index) => random.nextInt(imagenes.length)));

      oraciones.add(generarOracion(x, y));
      return Pair(
        x,
        y,
      );
    });
    super.initState();
  }

  String generarOracion(int a, int b) {
    int x = random.nextInt(3);
    switch (x) {
      case 0:
        return "Si tengo $a figuritas y mi mama me compra $b figuritas, ¿Cuántas figuritas tengo en total?";
      case 1:
        return "Mi papa me $a pegatinas y mi mama me $b pegatinas, ¿Cuántas pegatinas tengo en total?";
      case 2:
        return "Mi amigo Pepe tiene $a estampas y mi amigo Juan tiene $b estampas, ¿Si juntamos las estampas cuántas serían en total?";
    }
    return "";
  }

  Widget generarSuma(
    context,
    index,
  ) {
    int a = ejercicios[index].first;
    int b = ejercicios[index].second;
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      constraints: const BoxConstraints(
        maxWidth: 1200,
      ),
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.teal,
                width: 2,
              ),
            ),
            width: 300,
            child: Wrap(
              children: List.generate(
                (a + 1),
                (subindex) {
                  return subindex == 0
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            a.toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Image.asset(
                          'assets/${imagenes[imgG1[index][subindex - 1]]}.png',
                          width: 60,
                          height: 60,
                        );
                },
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Image.asset('assets/sumaicono.png', width: 80, height: 80),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.teal,
                width: 2,
              ),
            ),
            child: Wrap(
              children: List.generate(
                (b + 1),
                (subindex) {
                  return subindex == 0
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            b.toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Image.asset(
                          'assets/${imagenes[imgG2[index][subindex - 1]]}.png',
                          width: 60,
                          height: 60,
                        );
                },
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Image.asset('assets/igualicono.png', width: 80, height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image.asset('assets/nube.png', width: 120, height: 120),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: respuestas[index],
                    maxLength: 2,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 167, 99),
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                verificar == false
                    ? const SizedBox()
                    : (respuestas[index].text != (a + b).toString()
                        ? Positioned(
                            right: -20,
                            bottom: 5,
                            child: Image.asset('assets/tacha.png',
                                width: 60, height: 60),
                          )
                        : Positioned(
                            right: -20,
                            bottom: 5,
                            child: Image.asset('assets/palomita.png',
                                width: 60, height: 60),
                          )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              TextToSpeech tts = TextToSpeech();
              tts.setLanguage("es-MX");
              // String text =
              //     "Si tengo $a figuritas y mi mama me compra $b figuritas, ¿Cuántas figuritas tengo en total?";
              tts.speak(oraciones[index]);
            },
            child: Image.asset(
              'assets/escuchar_audio.png',
              scale: 2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SIREMA',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            letterSpacing: 10,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
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
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'EJERCICIO DE SUMA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'OBSERVA Y CONTESTA CORRECTAMENTE\nLAS SIGUIENTES SUMAS:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: List.generate(
                    10,
                    (index) => generarSuma(context, index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            verificar = true;
          });
        },
        child: Image.asset(
          'assets/verificar.png',
          scale: 1.5,
        ),
      ),
    );
  }
}

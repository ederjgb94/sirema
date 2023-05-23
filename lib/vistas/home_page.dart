import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
    'zanahoria'
  ];

  final List ejercicios = [];

  void iniciarEjercicios() {
    ejercicios.add([random.nextInt(10) + 1, random.nextInt(10) + 1]);
    ejercicios.add([random.nextInt(10) + 1, random.nextInt(10) + 1]);
  }

  Widget generarSuma() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          // color: Colors.red,
          child: Wrap(
            children: List.generate(
              imagenes.length,
              (index) => Image.asset(
                'assets/${imagenes[index]}.png',
                width: 60,
                height: 60,
              ),
            ),
          ),
        ),
        Image.asset('assets/sumaicono.png', width: 80, height: 80),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 400,
          // color: Colors.red,
          child: Wrap(
            children: List.generate(
              imagenes.length,
              (index) => Image.asset(
                'assets/${imagenes[index]}.png',
                width: 60,
                height: 60,
              ),
            ),
          ),
        ),
        Image.asset('assets/igualicono.png', width: 80, height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/nube.png', width: 120, height: 120),
              const Text(
                '24',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 167, 99),
                ),
              ),
            ],
          ),
        ),
        Image.asset('assets/palomita.png', width: 60, height: 60),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    iniciarEjercicios();
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
                fit: BoxFit.cover,
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
                    'OBSERVA Y CONTESTA CORRECTAMENTE LAS SIGUIENTES SUMAS:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                generarSuma(),
                const SizedBox(
                  height: 80,
                ),
                generarSuma(),
                const SizedBox(
                  height: 80,
                ),
                generarSuma(),
                const SizedBox(
                  height: 80,
                ),
                generarSuma(),
                const SizedBox(
                  height: 80,
                ),
                generarSuma(),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

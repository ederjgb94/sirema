import 'package:flutter/material.dart';
import 'package:sirema/vistas/video_page.dart';

class SeleccionarEjercicioPage extends StatelessWidget {
  const SeleccionarEjercicioPage({super.key});

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
        alignment: Alignment.topCenter,
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
          Image.asset(
            'assets/encabezado_botones.png',
            width: 800,
            height: 200,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/ejercicios_sumas');
                      },
                      child: Image.asset(
                        'assets/boton_suma.png',
                        width: 600,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const VideoPage(
                                url: 'suma.mp4',
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 225,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffB22600),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: const Icon(
                          Icons.video_camera_back,
                          size: 100,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/boton_resta.png',
                        width: 600,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const VideoPage(
                                url: 'restas.mp4',
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 225,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffB22600),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: const Icon(
                          Icons.video_camera_back,
                          size: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

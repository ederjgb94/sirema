import 'package:flutter/material.dart';
import 'package:sirema/vistas/video_page.dart';

class SeleccionarEjercicioPage extends StatelessWidget {
  const SeleccionarEjercicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 230, 254),
        title: Image.asset('assets/sirema.png', scale: 4),
        toolbarHeight: 100,
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
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.white,
                  child: Image.asset(
                    'assets/ejercicios_refuerzo.png',
                    scale: 1.8,
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/ejercicios_sumas');
                  },
                  child: Image.asset(
                    'assets/boton_suma.png',
                    scale: 4,
                  ),
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
                    width: 110,
                    height: 110,
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
                const SizedBox(
                  width: double.infinity,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/ejercicios_restas');
                  },
                  child: Image.asset(
                    'assets/boton_resta.png',
                    scale: 4,
                  ),
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
                    width: 110,
                    height: 110,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
        centerTitle: true,
        leading: SizedBox(
          height: 48,
          width: 48,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
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
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 20,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.white,
                  child: Image.asset(
                    'assets/ejercicios_refuerzo.png',
                    scale: 2.5,
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
                    scale: 6,
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
                    width: 90,
                    height: 90,
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
                      size: 80,
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
                    scale: 6,
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
                    width: 90,
                    height: 90,
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
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                Image.asset(
                  'assets/lapices.png',
                  scale: 2.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

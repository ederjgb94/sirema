import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:sirema/controlador/respuestas_controlller.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 230, 250),
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayedDisplay(
                  slidingBeginOffset: const Offset(-0.2, -4),
                  child: Image.asset(
                    'assets/sirema.png',
                    scale: 3,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Wrap(
                  spacing: 30,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    DelayedDisplay(
                      // slidingBeginOffset: const Offset(-0.35, -0.5),
                      delay: const Duration(milliseconds: 900),
                      fadingDuration: const Duration(milliseconds: 500),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/quienes_somos',
                              );
                            },
                            child: Image.asset(
                              'assets/btnquienessomos.png',
                              scale: 4,
                            ),
                          ),
                          Positioned(
                            left: -80,
                            top: -50,
                            child: Image.asset(
                              'assets/avionsito.png',
                              scale: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DelayedDisplay(
                      delay: const Duration(milliseconds: 1300),
                      fadingDuration: const Duration(milliseconds: 500),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/seleccionar_ejercicios');
                        },
                        child: Image.asset(
                          'assets/btnejercicios.png',
                          scale: 4,
                        ),
                      ),
                    ),
                    DelayedDisplay(
                      // slidingBeginOffset: const Offset(0.35, -0.5),
                      delay: const Duration(milliseconds: 1700),
                      fadingDuration: const Duration(milliseconds: 500),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/misionvision');
                        },
                        child: Image.asset(
                          'assets/btnmision.png',
                          scale: 4,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                    ),
                    DelayedDisplay(
                      delay: const Duration(milliseconds: 2100),
                      fadingDuration: const Duration(milliseconds: 500),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/discalculia');
                        },
                        child: Image.asset(
                          'assets/btndiscalculia.png',
                          scale: 4,
                        ),
                      ),
                    ),
                    DelayedDisplay(
                      delay: const Duration(milliseconds: 2400),
                      fadingDuration: const Duration(milliseconds: 500),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/objetivo_en_el_servicio');
                            },
                            child: Image.asset(
                              'assets/btnservicio.png',
                              scale: 4,
                            ),
                          ),
                          Positioned(
                            right: -60,
                            bottom: 15,
                            child: Image.asset(
                              'assets/lapicito.png',
                              scale: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                DelayedDisplay(
                  child: Image.asset(
                    'assets/frase.png',
                    scale: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (RespuestasController().getUid().isNotEmpty) {
            RespuestasController().logoutGoogle();
          } else {
            RespuestasController().loginWithGoogleFirebase();
          }
        },
        child: Icon(
          RespuestasController().getUid().isNotEmpty
              ? Icons.logout
              : Icons.login,
        ),
      ),
    );
  }
}

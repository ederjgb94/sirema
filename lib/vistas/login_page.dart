import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:sirema/controlador/respuestas_controlller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // String userAgent = window.navigator.userAgent.toLowerCase();
    // bool isMobile = userAgent.contains('mobile');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
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
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                DelayedDisplay(
                  slidingBeginOffset: const Offset(-0.2, -4),
                  child: Image.asset(
                    'assets/sirema.png',
                    scale: 2,
                    width: MediaQuery.of(context).size.width - 100,
                  ),
                ),
                const SizedBox(
                  height: 40,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/avioneta.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/barco.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/avion.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/carrito.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  height: 50,
                  width: double.infinity,
                ),
                DelayedDisplay(
                  slidingBeginOffset: const Offset(0, 0.05),
                  delay: const Duration(milliseconds: 900),
                  child: Center(
                    child: SizedBox(
                      child: GestureDetector(
                          onTap: () async {
                            await RespuestasController()
                                .loginWithGoogleFirebase()
                                .whenComplete(() {
                              Future.delayed(
                                const Duration(seconds: 1),
                              );
                              Navigator.pushReplacementNamed(context, '/');
                            });
                          },
                          child: Image.asset(
                            'assets/logo_google.png',
                            width: 300,
                            height: 100,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: 0,
          //   child: DelayedDisplay(
          //     slidingBeginOffset: const Offset(-0.2, -4),
          //     child: Image.asset(
          //       'assets/sirema.png',
          //       scale: 2,
          //       width: MediaQuery.of(context).size.width - 100,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

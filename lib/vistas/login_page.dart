import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sirema/controlador/respuestas_controlller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          Wrap(
            alignment: WrapAlignment.center,
            children: [
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xffEF1F26,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ),
                      ),
                      onPressed: () async {
                        await RespuestasController()
                            .loginWithGoogleFirebase()
                            .whenComplete(() {
                          Future.delayed(
                            const Duration(seconds: 1),
                          );
                          Navigator.pushReplacementNamed(context, '/');
                        });
                      },
                      child:
                          const Row(mainAxisSize: MainAxisSize.min, children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16,
                          child: Text(
                            'G',
                            style: TextStyle(
                              color: Color(
                                0xffEF1F26,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Iniciar con Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 50,
            child: DelayedDisplay(
              slidingBeginOffset: const Offset(-0.2, -4),
              child: Image.asset(
                'assets/sirema.png',
                scale: 2,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Lottie.asset(
              'assets/animate_fruit.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

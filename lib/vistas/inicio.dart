import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

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
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DelayedDisplay(
                slidingBeginOffset: const Offset(-0.2, -4),
                child: Image.asset(
                  'assets/sirema.png',
                  scale: 2,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/seleccionar_ejercicios');
                      },
                      child: Image.asset(
                        'assets/btnquienessomos.png',
                        scale: 2.2,
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 1300),
                    fadingDuration: const Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/seleccionar_ejercicios');
                      },
                      child: Image.asset(
                        'assets/btnejercicios.png',
                        scale: 2.2,
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    // slidingBeginOffset: const Offset(0.35, -0.5),
                    delay: const Duration(milliseconds: 1700),
                    fadingDuration: const Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/seleccionar_ejercicios');
                      },
                      child: Image.asset(
                        'assets/btnmision.png',
                        scale: 2.2,
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
                        Navigator.pushNamed(context, '/seleccionar_ejercicios');
                      },
                      child: Image.asset(
                        'assets/btndiscalculia.png',
                        scale: 2.2,
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 2400),
                    fadingDuration: const Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/seleccionar_ejercicios');
                      },
                      child: Image.asset(
                        'assets/btnservicio.png',
                        scale: 2.2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

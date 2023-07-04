import 'package:d_chart/d_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sirema/controlador/respuestas_controlller.dart';

class AlumnoPage extends StatefulWidget {
  const AlumnoPage({super.key});

  @override
  State<AlumnoPage> createState() => _AlumnoPageState();
}

class _AlumnoPageState extends State<AlumnoPage> {
  String selectedAge = '8';
  String selectedGen = 'Niño';

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String? name = user!.displayName;
    String? email = user.email;
    String? uid = user.uid;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 246, 230),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 50,
              color: Color.fromARGB(255, 159, 134, 84),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Hola $name',
              style: const TextStyle(
                color: Color.fromARGB(255, 159, 134, 84),
              ),
            ),
          ],
        ),
        toolbarHeight: 100,
        centerTitle: true,
        leading: SizedBox(
          height: 48,
          width: 48,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/seleccionar_ejercicios');
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
            padding: const EdgeInsets.only(
              top: 60,
              left: 60,
              right: 60,
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 15,
              children: [
                const SizedBox(
                  width: 300,
                  child: Text(
                    'Ingresa tu información abajo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 300,
                ),
                const SizedBox(
                  width: double.infinity,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Ingresar Edad'),
                    SizedBox(
                      width: 300,
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        dropdownColor: Colors.white,
                        value: selectedAge,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedAge = newValue!;
                          });
                        },
                        items: <String>['7', '8', '9', '10']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('¿Eres niña o niño?'),
                    SizedBox(
                      width: 300,
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        dropdownColor: Colors.white,
                        value: selectedGen,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGen = newValue!;
                          });
                        },
                        items: <String>[
                          'Niño',
                          'Niña',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: double.infinity,
                ),
                ElevatedButton(
                  onPressed: () {
                    var controller = RespuestasController();
                    controller.crearPerfil(
                        uid, email, name, selectedAge, selectedGen);
                    setState(() {});
                  },
                  child: const Text('Guardar'),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    'Ver mis resultados',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 300,
                ),
                const SizedBox(
                  width: double.infinity,
                ),
                FutureBuilder(
                  future: RespuestasController().checarPerfil(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == true) {
                        return SizedBox(
                          width: 240,
                          height: 200,
                          child: DChartPie(
                            data: const [
                              {'domain': 'Flutter', 'measure': 28},
                              {'domain': 'React Native', 'measure': 27},
                              {'domain': 'Ionic', 'measure': 20},
                              {'domain': 'Cordova', 'measure': 15},
                            ],
                            fillColor: (pieData, index) => Colors.purple,
                          ),
                        );
                      } else {
                        return const Wrap(
                          children: [
                            Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Para ver tu progreso, guarda tus datos primero',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        );
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moyenne/MoyenneGeneral.dart';
import 'package:moyenne/admis.dart';

import 'MoyenneMatiere.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcul moyenne ESEN',
      home: const MyHomePage(title: 'Calculer votre moyenne'),
   routes: {
        '/matiere' : (BuildContext context)=>MoyenneMatiere(),
      '/general' : (BuildContext context)=> MoyenneGeneral(),
     

      },
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 228, 228),

     
      body: SingleChildScrollView(
        
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 100),

SizedBox(height: 30),
              Container(
                
                
                height: 150,
                width: 450,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/esen2.png'),
                        fit: BoxFit.fitHeight)),
              ),
SizedBox(height: 40),
              ElevatedButton(
  onPressed: () {

    Navigator.pushReplacementNamed(context, '/general');
  },
  child: const Text('Calculer moyenne général'),
  style: ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
),
SizedBox(height: 35),

        ElevatedButton(
  onPressed: () {

Navigator.pushReplacementNamed(context, '/matiere');},
  
  child: const Text("Calculer moyenne d'une matière"),
  style: ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
),
            ],
          ),
        ),

      ),
    );
  }
}



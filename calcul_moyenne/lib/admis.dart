import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moyenne/admis.dart';

import 'main.dart';

class admis extends StatelessWidget {
  final double calcul;
  final String mention;

  const admis({Key? key, required this.calcul, required this.mention}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 230, 228, 228),
      body: SingleChildScrollView(
        
     
          
          child: Column(
            children: [
              
              SizedBox(height: 120),
              Container(
                height: 200,
                width: 500,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('felicitation.png'),
                        fit: BoxFit.fitHeight)),
              ),
              SizedBox(height: 10),
              Text(
                "Félicitation  \n",
                style: TextStyle(fontSize: 25, fontFamily: 'DancingScript', fontWeight: FontWeight.bold),
              ),
              Text(
                "Admis avec la mention " + mention,
                style: TextStyle(fontSize: 20, fontFamily: 'Optima'),
              ),
              SizedBox(height: 10),
              Text(
                "Votre moyenne est = " + calcul.toStringAsFixed(2),
                style: TextStyle(fontSize: 20, fontFamily: 'Optima'),
              ),
SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      icon: const Icon(Icons.home),
                      label: const Text("Accueil"),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                        primary: Color.fromARGB(255, 85, 142, 213),
                      ),
                    ),


            ],
          ),

        
        
      ),
    );
  }
}

var mention;

RetourMention(moyenne) {
  if (moyenne >= 18) {
    mention = "une mention très bien";
  } else if (moyenne < 18 && moyenne >= 14) {
    mention = "bien";
  } else if (moyenne < 14 && moyenne >= 12) {
    mention = "assez bien";
  } else if (moyenne < 12 && moyenne >= 10) {
    mention = "passable";
  }

  return mention;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moyenne/admis.dart';

import 'main.dart';

class MoyenneGeneral extends StatefulWidget {
  const MoyenneGeneral({Key? key}) : super(key: key);

  @override
  State<MoyenneGeneral> createState() => _MoyenneGeneralState();
}

class _MoyenneGeneralState extends State<MoyenneGeneral> {
  TextEditingController matiere1 = new TextEditingController();
  TextEditingController matiere2 = new TextEditingController();
  TextEditingController matiere3 = new TextEditingController();
  TextEditingController matiere4 = new TextEditingController();
  TextEditingController matiere5 = new TextEditingController();
  TextEditingController matiere6 = new TextEditingController();

  var calcul;
  var score;

  calculMoy(matiere1, matiere2, matiere3, matiere4, matiere5, matiere6) {
    calcul =
        (matiere1 + matiere2 + matiere3 + matiere4 + matiere5 + matiere6) / 6;

    if (calcul < 10) {
      affiche(context, calcul);
    } else {
      
if (calcul >= 18) {
    mention = "très bien";
  } else if (calcul < 18 && calcul >= 14) {
    mention = "bien";
  } else if (calcul < 14 && calcul >= 12) {
    mention = "assez bien";
  } else if (calcul < 12 && calcul >= 10) {
    mention = "passable";
  }



      Navigator.push(context,
          MaterialPageRoute(builder: (context) => admis(calcul: calcul, mention:mention)));
    }
  }

  void clearText() {
    matiere1.clear();
    matiere2.clear();
    matiere3.clear();
    matiere4.clear();
    matiere5.clear();
    matiere6.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
      appBar: AppBar(
        title: Text("Calcul moyenne général"),
        backgroundColor: const Color.fromARGB(255, 85, 142, 213),
        centerTitle: true, // titre yet7at f center
        leading: IconButton(
    onPressed: () {

Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));


    },
    icon: Icon(Icons.home),
  ),
      ),
      body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 430,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/esen2.png'),
                        fit: BoxFit.fitHeight)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(60, 15, 60, 30),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: matiere1,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Entrer le moyenne de matière 1",
                        labelText: "Matière 1",
                      ),
                    ),
                    TextFormField(
                      controller: matiere2,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Entrer le moyenne de matière 2",
                        labelText: "Matière 2",
                      ),
                    ),
                    TextFormField(
                      controller: matiere3,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Entrer le moyenne de matière 3",
                        labelText: "Matière 3",
                      ),
                    ),
                    TextFormField(
                      controller: matiere4,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Entrer le moyenne de matière 4",
                        labelText: "Matière 4",
                      ),
                    ),
                    TextFormField(
                      controller: matiere5,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Entrer le moyenne de matière 5",
                        labelText: "Matière 5",
                      ),
                    ),
                    TextFormField(
                      controller: matiere6,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Entrer le moyenne de matière 6",
                        labelText: "Matière 6",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        calculMoy(
                          double.parse(matiere1.text),
                          double.parse(matiere2.text),
                          double.parse(matiere3.text),
                          double.parse(matiere4.text),
                          double.parse(matiere5.text),
                          double.parse(matiere6.text),
                        );
                      },
                      icon: const Icon(Icons.calculate),
                      label: const Text("Calculer"),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                        primary: Color.fromARGB(255, 85, 142, 213),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton.icon(
                      onPressed: clearText,
                      icon: const Icon(Icons.clear),
                      label: const Text("Vider les champs"),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                        primary: Color.fromARGB(255, 85, 142, 213),
                      ),
                    ),
                  ],
                )),
              )
            ],
          ),
        
      ),
    );
  }
}

affiche(BuildContext context, moyenne) {
  Widget closeButton = FlatButton(
      onPressed: () => Navigator.pop(context), child: Text('Fermer'));
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), 
    backgroundColor: Color.fromARGB(255, 236, 239, 243),
    title:Text("Malheuresement", textAlign: TextAlign.center, style: TextStyle(color: Color(0x6C63FE).withOpacity(1)) ,),
    content:
        Text("Redouble avec moyenne général est = " + moyenne.toStringAsFixed(2)),
    actions: [closeButton],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}



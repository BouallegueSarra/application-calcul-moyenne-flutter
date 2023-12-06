import 'package:flutter/material.dart';
import 'package:moyenne/main.dart';

class MoyenneMatiere extends StatefulWidget {
  const MoyenneMatiere({Key? key}) : super(key: key);

  @override
  State<MoyenneMatiere> createState() => _MoyenneMatiereState();
}


class _MoyenneMatiereState extends State<MoyenneMatiere> {
  //  var _formkey = GlobalKey<FormState>();
  TextEditingController matiere = new TextEditingController();
  TextEditingController noteDS = new TextEditingController();
  TextEditingController noteExamen = new TextEditingController();
  TextEditingController coef = new TextEditingController();

  var calcul;
  var score;

  calculMoy(matiere, ds, examen, coef) {
    calcul = (ds * 0.3 + examen * 0.7);
    score = calcul * coef;
    affiche(context, calcul, matiere, score);
  }

void clearText() {
    matiere.clear();
    noteDS.clear();
    noteExamen.clear();
    coef.clear();
  }



  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor:  const Color.fromARGB(255, 230, 228, 228),
      appBar: AppBar(
        title: Text("Calcul moyenne par matière"),
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
              Container(
                
                height: 100,
                width: 430,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/esen2.png'),
                        fit: BoxFit.fitHeight)),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.fromLTRB(60, 15, 60, 30),
                    child: Column(
                  children: [
                    TextFormField(
                      controller: matiere,
                      
                      style: const TextStyle(color: Colors.black),
                     
                      decoration: const InputDecoration(
                        labelText: "Matiere",
                                                     
                      ),
                    ),



                    TextFormField(
                      controller: noteDS,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: "Note du ds",
                      ),
                    ),



                    TextFormField(
                      controller: noteExamen,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: "Note de l'examen",
                      ),
                    ),



                    TextFormField(
                      controller: coef,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        labelText: "Coefficient du matiere",
                      ),
                    ),
                    SizedBox(height: 15,),


                    ElevatedButton.icon(
                      onPressed: () {
                        
                      
                        calculMoy(
                            matiere.text,
                            double.parse(noteDS.text),
                            double.parse(noteExamen.text),
                            int.parse(coef.text));
                      },
                      icon: const Icon(Icons.calculate),
                      label: const Text("Calculer"),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                        primary: Color.fromARGB(255, 85, 142, 213),
                      ),
                    ),
                    

                    SizedBox(height: 15,),
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
                ),
              )
            ],
          ),
        
      ),
    );
  }
}

affiche(BuildContext context, moyenne, matiere, score) {
  Widget closeButton =
      FlatButton(onPressed: () => Navigator.pop(context), child: Text('Fermer'));
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), 
    backgroundColor: Color.fromARGB(255, 236, 239, 243),
    // backgroundColor: Colors.grey[800],
     title:Text(matiere, textAlign: TextAlign.center, style: TextStyle(color: Color(0x6C63FE).withOpacity(1)) ,),
    content: Text("Moyenne = " + moyenne.toStringAsFixed(2) +"\n"+
        "Score = " +
        score.toStringAsFixed(2)),
    actions: [closeButton],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}


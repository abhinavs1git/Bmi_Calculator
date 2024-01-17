import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  var wtController = TextEditingController();
  var cmController = TextEditingController();
  var result = "";
  var alertt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.3),
        body: ListView(padding: EdgeInsets.zero, children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 100, 20, 10),
            height: 240,
            width: 380,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    blurRadius: 2,
                  ),
                ],
                color: Colors.green.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
                border:
                    Border.all(width: 1, color: Colors.black.withOpacity(0.7))),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: Text("Weight",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 30)),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        child: TextField(
                          controller: wtController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                            hintText: "0",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 60,
                        height: 50,
                        child: Text(
                          "Kg",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            height: 240,
            width: 380,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    blurRadius: 2,
                  ),
                ],
                color: Colors.green.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
                border:
                    Border.all(width: 1, color: Colors.black.withOpacity(0.7))),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: Text("Height",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 30)),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        child: TextField(
                          controller: cmController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              border: const OutlineInputBorder(),
                              hintText: "0",
                              fillColor: Colors.green.withOpacity(0.2)),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 60,
                        height: 50,
                        child: Text(
                          "Cm",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
              child: Container(
                  width: 180,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var cm = cmController.text.toString();

                      if (wt != "" && cm != "") {
                        double iWt = double.parse(wt);
                        double iCm = double.parse(cm);

                        double tM = iCm / 100;
                        double bmi = iWt / (tM * tM);
                        int rBmi = bmi.round();

                        var alert = "";

                        if (bmi > 25) {
                          alert = "Overweight";
                        } else if (bmi > 18) {
                          alert = "Healthy";
                        } else {
                          alert = "Underweight";
                        }

                        setState(() {
                          alertt = "$alert";
                          result = "$rBmi";
                        });
                      } else {
                        setState(() {
                          alertt = "_";
                          result = "_";
                        });
                      }
                    },
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green.withGreen(120)),
                  ))),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            height: 150,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.1),
                  blurRadius: 2,
                ),
              ],
              color: Colors.green.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25),
              border:
                  Border.all(width: 1, color: Colors.black.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    child: Text(result,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 48)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    child: Text(
                      alertt,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}

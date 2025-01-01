import 'package:flutter/material.dart';
import 'countries.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GuessCountry(),
    );
  }
}

class GuessCountry extends StatefulWidget {
  const GuessCountry({super.key});

  @override
  State<GuessCountry> createState() => _GuessCountryState();
}

class _GuessCountryState extends State<GuessCountry> {
  int score = 0;
  int totalAttempted = 0;
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(
          'Guess The Capital of Country',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          setState(() {
            score = 0;
            totalAttempted = 0;
          });
        },
        child: Text(
          'Reset',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'SCORE  $score/$totalAttempted',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              )
            ]),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: 200,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(showAnswer ? 'CAPITAL' : 'COUNTRY',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold)),
                      Text(
                          showAnswer
                              ? countries[totalAttempted]['capital']!
                              : countries[totalAttempted]['name']!,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.indigo)),
                onPressed: () {
                  setState(() {
                    showAnswer = !showAnswer;
                  });
                },
                child: Text(
                  'SHOW ${showAnswer ? 'QUESTION' : 'ANSWER'}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green)),
                  onPressed: () {
                    setState(() {
                      if (totalAttempted < countries.length - 1) {
                        score++;
                        totalAttempted++;
                      } else {
                        Alert(
                                context: context,
                                title: 'Alert',
                                desc:
                                    'You have already reached to the end of the list')
                            .show();
                      }
                    });
                  },
                  child: Text(
                    'CORRECT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red)),
                  onPressed: () {
                    setState(() {
                      if (totalAttempted < countries.length - 1) {
                        totalAttempted++;
                      } else {
                        Alert(
                                context: context,
                                title: 'Alert',
                                desc:
                                    'You have already reached to the end of the list')
                            .show();
                      }
                    });
                  },
                  child: Text(
                    'INCORRECT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}

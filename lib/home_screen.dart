import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  void equalpress() {
    String finalUserInput = userInput;
    finalUserInput = finalUserInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userInput.toString(),
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        answer.toString(),
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
                 Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyApp(title: 'AC', onpress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        }),
                        MyApp(title: '+/-', onpress: () {
                          setState(() {
                            userInput += '+/-';
                          });
                        }),
                        MyApp(title: '%', onpress: () {
                          setState(() {
                            userInput += '%';
                          });
                        }),
                        MyApp(
                          title: '/',
                          onpress: () {
                            setState(() {
                              userInput += '/';
                            });
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyApp(title: '7', onpress: () {
                          setState(() {
                            userInput += '7';
                          });
                        }),
                        MyApp(title: '8', onpress: () {
                          setState(() {
                            userInput += '8';
                          });
                        }),
                        MyApp(title: '0', onpress: () {
                          setState(() {
                            userInput += '0';
                          });
                        }),
                        MyApp(
                          title: 'x',
                          onpress: () {
                            setState(() {
                              userInput += 'x';
                            });
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyApp(title: '4', onpress: () {
                          setState(() {
                            userInput += '4';
                          });
                        }),
                        MyApp(title: '5', onpress: () {
                          setState(() {
                            userInput += '5';
                          });
                        }),
                        MyApp(title: '6', onpress: () {
                          setState(() {
                            userInput += '6';
                          });
                        }),
                        MyApp(
                          title: '-',
                          onpress: () {
                            setState(() {
                              userInput += '-';
                            });
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyApp(title: '1', onpress: () {
                          setState(() {
                            userInput += '1';
                          });
                        }),
                        MyApp(title: '2', onpress: () {
                          setState(() {
                            userInput += '2';
                          });
                        }),
                        MyApp(title: '3', onpress: () {
                          setState(() {
                            userInput += '3';
                          });
                        }),
                        MyApp(
                          title: '+',
                          onpress: () {
                            setState(() {
                              userInput += '+';
                            });
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyApp(title: '0', onpress: () {
                          setState(() {
                            userInput += '0';
                          });
                        }),
                        MyApp(title: '-', onpress: () {
                          setState(() {
                            userInput += '-';
                          });
                        }),
                        MyApp(title: 'DEL', onpress: () {
                          setState(() {
                            if (userInput.isNotEmpty) {
                              userInput = userInput.substring(0, userInput.length - 1);
                            }
                          });
                        }),
                        MyApp(
                          title: '=',
                          onpress: () {
                            equalpress();
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;

  const MyApp({
    super.key,
    required this.title,
    this.color = const Color(0xffa5a5a5),
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
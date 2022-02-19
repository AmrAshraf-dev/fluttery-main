import "package:flutter/material.dart";
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _data = [
    {
      'questionText':
          'With over 222 million units sold, what is Apple\'s highest-selling iPhone model ?',
      'answers': [
        {'text': 'iPhone 6/6 Plus', 'score': 1.0},
        {'text': 'iPhone 7', 'score': 0.0},
        {'text': 'iPhone 8', 'score': 0.0},
        {'text': 'None of the above', 'score': 0.0},
      ]
    },
    {
      'questionText':
          'In which year was the Microsoft XP operating system released ?',
      'answers': [
        {'text': '2000', 'score': 0.0},
        {'text': '2001', 'score': 1.0},
        {'text': '1999', 'score': 0.0},
        {'text': '1998', 'score': 0.0},
      ]
    },
    {
      'questionText': 'Elon Musk is the CEO of which global brand?',
      'answers': [
        {'text': 'Microsoft', 'score': 0.0},
        {'text': 'Amazon', 'score': 0.0},
        {'text': 'Tesla', 'score': 1.0},
        {'text': 'Meta', 'score': 0.0}
      ]
    },
    {
      'questionText': 'Which operating system does a Google Pixel phone use?',
      'answers': [
        {'text': 'IOS', 'score': 0.0},
        {'text': 'Windows Phone', 'score': 0.0},
        {'text': 'Android', 'score': 1.0},
        {'text': 'None of the above', 'score': 0.0}
      ]
    },
    {
      'questionText': 'In which year was the Nintendo 64 released in Europe?',
      'answers': [
        {'text': '1994', 'score': 0.0},
        {'text': '1995', 'score': 0.0},
        {'text': '1996', 'score': 0.0},
        {'text': '1997', 'score': 1.0}
      ]
    }
  ];

  var _indexQuestion = 0;
  double _totalScore = 0.0;

  void _answerQuestion(double score) {
    _totalScore += score;

    setState(() {
      _indexQuestion += 1;
    });
  }

  void _restart() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Quiz",
              style: TextStyle(
                color: Color(0xffF5FFF0),
              ),
            ),
          ),
          backgroundColor: const Color(0xff6B443D),
        ),
        body: Align(
          alignment: Alignment.center,
          child: (_indexQuestion <= 4 && _indexQuestion >= 0)
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  indexQuestion: _indexQuestion,
                  data: _data)
              : Result(_totalScore, _restart),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var activeScreen = "start-screen";
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void _switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = "question-screen";
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers.clear();
      activeScreen = "start-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetScreen = StartScreen(_switchScreen);

    if (activeScreen == 'question-screen') {
      widgetScreen = QuestionsScreen(onSelectAnswer: _chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      widgetScreen = ResultScreen(
        choosenAnswers: _selectedAnswers,
        onRestartQuiz: _restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 6, 8, 129),
              Color.fromARGB(255, 22, 19, 173)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          // child: activeScreen,
          // child: activeScreen == "start-screen"
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),
          child: widgetScreen,
        ),
      ),
    );
  }
}

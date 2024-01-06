import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/components/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.onRestartQuiz});

  final void Function() onRestartQuiz;
  final List<String> choosenAnswers;

  List<Map<String, Object>> get summaryResult {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": choosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int totalCorrectAnswered = summaryResult
        .where((item) => item['correct_answer'] == item['user_answer'])
        .length;
    int totalQuestion = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $totalCorrectAnswered out of $totalQuestion questions correctly!",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color.fromARGB(255, 228, 219, 219),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionSummary(summaryData: summaryResult),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              onPressed: onRestartQuiz,
              label: const Text("Restart Quiz"),
              icon: const Icon(Icons.replay),
            ),
          ],
        ),
      ),
    );
  }
}

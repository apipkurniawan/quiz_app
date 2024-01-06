import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item['correct_answer'].toString() ==
                            item['user_answer'].toString()
                        ? const Color.fromARGB(255, 91, 209, 95)
                        : const Color.fromARGB(255, 228, 68, 56),
                  ),
                  width: 40,
                  height: 30,
                  child: Center(
                    child: Text(
                      ((item['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (item['question']).toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        (item['correct_answer']).toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 194, 191, 191),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        (item['user_answer']).toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 27, 226, 233),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:dart_application_1/score.dart';

class StudentScore extends Score {
  final String name;

  StudentScore({required super.score, required this.name});
  // StudentScore(this.name, int score) : super(score);

  @override
  void show() {
    super.show();
  }

  @override
  String toString() {
    return 'StudentScore(name: $name, score: ${super.score})';
  }
}

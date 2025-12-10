abstract class Score {
  final String name;
  final int score;

  const Score({required this.name, required this.score});

  void show() {}

  @override
  String toString() {
    return 'StudentScore(name: $name, score: $score)';
  }
}

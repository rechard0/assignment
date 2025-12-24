import 'package:flutter/material.dart';

class TodoDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final bool isDone;
  final bool isFavorite;

  const TodoDetailPage({
    Key? key,
    required this.title,
    required this.description,
    this.isDone = false,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: Colors.black,
            ),
            onPressed: () {
              // 즐겨찾기 토글 기능
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),

            // 세부사항 섹션
            Row(
              children: [
                const Icon(Icons.remove, size: 20, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  '세부 내용은 여기에 작성합니다.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 설명 텍스트
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

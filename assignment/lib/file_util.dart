import 'package:dart_application_1/student_score.dart';
import 'dart:io';
import 'dart:convert';

class FileUtil {
  List<StudentScore> fireRoad(String firepath)
  // async  쓰면 비동기
  {
    final file = File(firepath);
    final lines = file.readAsLinesSync(encoding: utf8);
    // final lines = await file.readAsLines(); //쓰면 비동기

    List<StudentScore> students = [];

    lines.forEach((item) {
      List<String> split = item.split(",");
      // student[split[0]] = int.parse(split[1]);
      StudentScore student = StudentScore(
        name: split[0],
        score: int.parse(split[1]),
      );
      students.add(student);
    });

    print(students);

    return students;
  }

  void filedownload(List<StudentScore> students) {
    while (true) {
      print("어떤 학생의 통계를 확인하시겠습니까?");
      String? name = stdin.readLineSync(encoding: utf8);

      try {
        StudentScore found = students.firstWhere(
          (student) => student.name == name,
        );

        print("이름: ${found.name}, 점수: ${found.score}");

        final outputFile = File("lib/students_result.txt");
        outputFile.writeAsStringSync(
          "이름: ${found.name}, 점수: ${found.score}\n",
          mode: FileMode.append,
          encoding: utf8,
        );

        print("저장이 완료되었습니다.");
        break;
      } catch (e) {
        print("잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.");
      }
    }
  }
}

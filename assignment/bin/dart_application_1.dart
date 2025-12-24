import 'dart:io';
import 'dart:convert';

import 'package:dart_application_1/file_util.dart';
import 'package:dart_application_1/student_score.dart';

void main(List<String> arguments) {
  try {
    String path = "lib/students.txt";
    List<StudentScore> students = FileUtil().fireRoad(path);

    FileUtil().filedownload(students);
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
}

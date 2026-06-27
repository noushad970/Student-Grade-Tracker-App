import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => _subjects;

  void addSubject(String name, double mark) {
    _subjects.add(Subject(name: name, mark: mark));

    notifyListeners();
  }

  void removeSubject(int index) {
    _subjects.removeAt(index);

    notifyListeners();
  }

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0;

    double total = _subjects.fold(0, (sum, item) => sum + item.mark);

    return total / _subjects.length;
  }

  String get overallGrade {
    double avg = averageMark;

    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';

    return 'F';
  }

  // Requirement: use where()
  List<Subject> get passedSubjects {
    return _subjects.where((s) => s.mark >= 50).toList();
  }
}

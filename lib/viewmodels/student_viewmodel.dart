import 'package:flutter/foundation.dart';
import '../models/student_model.dart';

class StudentViewModel extends ChangeNotifier {
  StudentModel _student = StudentModel(
    name: 'Phindile', 
  currentSubject: 'TPG316C', 
  subjects: ['TPG316C', 'SOD316C' , 'CMN316C' , 'ITS316C'],
   currentIndex: 0);




   String get studentName => _student.name;
   String get currentSubject => _student.currentSubject;
   List <String> get subjects => _student.subjects;
   int get currentIndex => _student.currentIndex;

   void changeSubject(){
    int newIndex =(_student.currentIndex + 1) % _student.subjects.length;
    String newSubject= _student.subjects[newIndex];

    _student=_student.copyWith(
      currentIndex: newIndex,
      currentSubject: newSubject,
    );
   }
}


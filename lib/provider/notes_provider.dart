import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesNotifer extends ChangeNotifier {
  List notesList = [];

  void onSaveNote(String note) {
    notesList.add(note);
    notifyListeners();
  }

  void removeNote(int index) {
    notesList.removeAt(index);
    notifyListeners();
  }
}

final notesProvider = ChangeNotifierProvider<NotesNotifer>((ref) {
  return NotesNotifer();
});

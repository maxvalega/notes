import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesNotifer extends ChangeNotifier {
  List<String> notesList = [];
  NotesNotifer() {
    _loadNotes();
  }
  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedNotes = prefs.getStringList('notes') ?? [];
    notesList = storedNotes;
    notifyListeners();
  }

  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('notes', notesList);
  }

  void onSaveNote(String note) {
    notesList.add(note);
    _saveNotes();
    notifyListeners();
  }

  void removeNote(int index) {
    notesList.removeAt(index);
    _saveNotes();
    notifyListeners();
  }
}

final notesProvider = ChangeNotifierProvider<NotesNotifer>((ref) {
  return NotesNotifer();
});

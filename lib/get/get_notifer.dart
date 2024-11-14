import 'package:get_it/get_it.dart';
import 'package:notes/provider/notes_provider.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<NotesNotifer>(() => NotesNotifer());
  print("check if data is coming ${notesProvider}");
}

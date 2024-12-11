import 'dart:io';

List<Map<String, dynamic>> todos = [];
List<Map<String, dynamic>> completedTodos = [];

void addTodo(String description) {
  todos.add({'description': description, 'isDone': false});
}

void markAsDone(int index) {
  if (index >= 0 && index < todos.length) {
    var todo = todos.removeAt(index);
    todo['isDone'] = true;
    completedTodos.add(todo);
  }
}

void displayTodos() {
  print("\nAktuelle Todos:");
  for (int i = 0; i < todos.length; i++) {
    print("${i + 1}. ${todos[i]['description']}");
  }
}

void displayCompletedTodos() {
  print("\nErledigte Todos:");
  for (var i = 0; i < completedTodos.length; i++) {
    print("${i + 1}. ${completedTodos[i]['description']}");
  }
}

void main() {
  while (true) {
    print("\n--- Todo-App Menü ---");
    print("1. Neues Todo hinzufügen");
    print("2. Todos anzeigen");
    print("3. Todo als erledigt markieren");
    print("4. Erledigte Todos anzeigen");
    print("5. Beenden");
    
    stdout.write("Wählen Sie eine Option (1-5): ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        stdout.write("Beschreibung des neuen Todos: ");
        var description = stdin.readLineSync() ?? "";
        addTodo(description);
        print("Todo hinzugefügt!");
        break;
      case "2":
        displayTodos();
        break;
      case "3":
        displayTodos();
        stdout.write("Nummer des erledigten Todos: ");
        var index = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
        markAsDone(index - 1);
        print("Todo als erledigt markiert!");
        break;
      case "4":
        displayCompletedTodos();
        break;
      case "5":
        print("Auf Wiedersehen!");
        return;
      default:
        print("Ungültige Eingabe. Bitte wählen Sie eine Option zwischen 1 und 5.");
    }
  }
}

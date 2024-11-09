class ToDoListModel {
  List<Todo>? todo;

  ToDoListModel({this.todo});

  ToDoListModel.fromJson(Map<String, dynamic> json) {
    if (json['Todo'] != null) {
      todo = <Todo>[];
      json['Todo'].forEach((v) {
        todo!.add(Todo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (todo != null) {
      data['Todo'] = todo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Todo {

  int? id;
  String? title;
  bool? completed;

  Todo({ this.id, this.title, this.completed});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hamilton_base_project/Utils/cont_url.dart';
import '../../Service/network_services.dart';
import '../../Utils/ReusableWidget/reusable_snackbar.dart';
import '../../main.dart';
import 'get_todo_list_model.dart';

class HomeScreenController extends GetxController {

  //Note - this controller has pagination feature

  var todoModel = ToDoListModel();
  Rx<List<Todo>> todosList = RxList<Todo>([]).obs;
  List<String> myLocalTodoList = [];
  RxBool isLoading = false.obs;
  RxBool hasMoreTodoListData = true.obs;
  RxInt page = 1.obs;

  TextEditingController localTodoController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    loadMoreTodoList();
    super.onInit();
  }

  @override
  void onReady() {
    fetchTodoList(clearList: true);
    super.onReady();
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadTodos() async {
    myLocalTodoList = prefs.getStringList('todos') ?? [];
    for (int i = 0; i < myLocalTodoList.length; i++) {
      Todo tempTodo = Todo(title: myLocalTodoList[i], completed: false);
      todosList.value.insert(0, tempTodo);
    }
  }

  void addTodo() {
    final todoTitle = localTodoController.text;
    if (todoTitle.isNotEmpty) {
      Todo tempTodo = Todo(title: todoTitle, completed: false);

      todosList.value.insert(0, tempTodo);
      myLocalTodoList.add(todoTitle);
      localTodoController.clear();
      saveTodos();
    }
  }

  Future<void> saveTodos() async {
    await prefs.setStringList('todos', myLocalTodoList);
  }

  Future<void> fetchTodoList({bool clearList = false}) async {
    if (clearList) {
      page.value = 1;
      todosList.value.clear();
      loadTodos();
    }
    try {
      isLoading.value = true;

      var data = await NetworkService.get(
          url:  "${ConstUrl.baseUrl}${ConstUrl.fetchTodoEndPoint}$page&_limit=50");
      List<Todo> newTodoList = [];

      if (data != null) {
        Map<String, dynamic> obj = {"Todo": data};

        todoModel = ToDoListModel.fromJson(obj);
        for (int i = 0; i < todoModel.todo!.length; i++) {
          newTodoList.add(todoModel.todo![i]);
        }
        if (newTodoList.isEmpty || newTodoList.length < 50) {
          hasMoreTodoListData.value = false;
        }

        todosList.value.addAll(newTodoList);

        page.value++;

        todosList.refresh();

        isLoading.value = false;
      } else {
        isLoading.value = false;
        showSnackBar(isForError :true , message: data['message'].toString());      }
    } catch (e) {
      isLoading.value = false;
       showSnackBar(isForError :true , message: e.toString());
      debugPrint(e.toString());
    }
  }

  void filterTodos(String query) {
    List<Todo> todos = todosList.value.toList();
    if (query.isNotEmpty) {
      todosList.value.assignAll(todos.where((todo) =>
          (todo.title?.toLowerCase() ?? "").contains(query.toLowerCase())));

      hasMoreTodoListData.value = false;
    } else {
      fetchTodoList(clearList: true);
    }
  }

  void loadMoreTodoList() {
    double lastValue = 0.0;

    scrollController.addListener(() {
      if (scrollController.position.pixels >
          (scrollController.position.maxScrollExtent * .98)) {
        if (lastValue != scrollController.position.maxScrollExtent) {
          debugPrint("conditions satisfied");
          fetchTodoList();
          lastValue = scrollController.position.maxScrollExtent;
        }
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/ReUsableWidget/reusable_loading_with_text.dart';
import '../../Utils/ReusableWidget/reusable_image_with_shimmer.dart';
import '../Animal/animal_list_screen.dart';
import 'home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  static const routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Todos'),
        actions: [
          SizedBox(
            width: 130,
            child: IconButton(
                onPressed: () {
                  Get.toNamed(AnimalListScreen.routeName);
                },
                icon: const Text(
                  "Go to Task-4",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTodoDialog(context: context);
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: searchTextField(),
            ),
            Obx(
              () {
                return !(controller.todosList.value.isEmpty &&
                        controller.isLoading.value == false)
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: controller.todosList.value.length + 1,
                        itemBuilder: (context, index) {
                          if (index == controller.todosList.value.length) {
                            if (controller.hasMoreTodoListData.value) {
                              return const ReusableLoadingWithText(
                                  message: "Loading...");
                            } else {
                              return const SizedBox();
                            }
                          }
                          final todo = controller.todosList.value[index];
                          return Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    //
                                  },
                                  child: ListTile(
                                    leading: const ReusableImageWithShimmer(
                                      url:
                                          "https://cdn.iconscout.com/icon/premium/png-512-thumb/task-71158.png?f=webp&w=512",
                                      height: 50,
                                    ),
                                    title: Text(
                                      todo.title ?? "",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text(
                                      todo.completed != null &&
                                              todo.completed == true
                                          ? 'Completed'
                                          : 'Not Completed',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                            ],
                          );
                        })
                    : const Center(
                        child: Text(
                          "No Data Available",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, color: Colors.grey),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox searchTextField() {
    return SizedBox(
      height: 42,
      child: Material(
          elevation: 2,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: TextFormField(
            controller: controller.searchController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              prefixIcon: const Icon(
                Icons.search,
                size: 24,
                color: Colors.teal,
              ),
              hintText: 'Search by title...',
              hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            onTapOutside: (value) {
              FocusScope.of(Get.context!).unfocus();
            },
            onChanged: (value) {
              controller.filterTodos(value);
            },
          )),
    );
  }

  Future<void> showAddTodoDialog({required BuildContext context}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextField(
            controller: controller.localTodoController,
            decoration: const InputDecoration(
              labelText: 'TODO Title',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.addTodo();
              },
              child: const Text('Submit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

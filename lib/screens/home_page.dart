import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [];

  Future<void> saveTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodeData = jsonEncode(toDoList);
    await prefs.setString("todo_list", encodeData);
  }

  Future<void> loadTodoList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodeData = prefs.getString("todo_list");
    if (encodeData != null) {
      setState(() {
        toDoList = List<dynamic>.from(jsonDecode(encodeData));
      });
    }
  }

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      saveTodoList(); // 체크박스 상태가 변경될 때마다 저장
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
      saveTodoList(); // 항목이 삭제될 때마다 저장
    });
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      // TextField에 들어온 문자열이 빈 문자열이 아닐 경우에만 실행
      setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
        saveTodoList(); // 새로운 항목이 추가될 때마다 저장
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Simple ToDo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "오늘의 할 일을 적어주세요",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.blueGrey,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

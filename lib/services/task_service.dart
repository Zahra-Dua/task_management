import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskService {
  static const String _tasksKey = 'tasks';

  // Load tasks from SharedPreferences
  Future<List<Task>> loadTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = prefs.getString(_tasksKey);

      if (tasksJson == null) {
        return [];
      }

      final List<dynamic> tasksList = json.decode(tasksJson);
      return tasksList.map((taskJson) => Task.fromJson(taskJson)).toList();
    } catch (e) {
      print('Error loading tasks: $e');
      return [];
    }
  }

  // Save tasks to SharedPreferences
  Future<void> saveTasks(List<Task> tasks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = json.encode(
        tasks.map((task) => task.toJson()).toList(),
      );
      await prefs.setString(_tasksKey, tasksJson);
    } catch (e) {
      print('Error saving tasks: $e');
    }
  }

  // Add a new task
  Future<void> addTask(Task task) async {
    final tasks = await loadTasks();
    tasks.add(task);
    await saveTasks(tasks);
  }

  // Update an existing task
  Future<void> updateTask(Task updatedTask) async {
    final tasks = await loadTasks();
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);

    if (index != -1) {
      tasks[index] = updatedTask;
      await saveTasks(tasks);
    }
  }

  // Delete a task
  Future<void> deleteTask(String taskId) async {
    final tasks = await loadTasks();
    tasks.removeWhere((task) => task.id == taskId);
    await saveTasks(tasks);
  }

  // Toggle task completion status
  Future<void> toggleTaskCompletion(String taskId) async {
    final tasks = await loadTasks();
    final index = tasks.indexWhere((task) => task.id == taskId);

    if (index != -1) {
      tasks[index] = tasks[index].copyWith(
        isCompleted: !tasks[index].isCompleted,
      );
      await saveTasks(tasks);
    }
  }
}

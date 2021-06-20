void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String taskData2 = await task2();
  task3(taskData2);
}

void task1() {
  String result = 'task1 data';
  print('Task 1 complete');
}

Future task2() async {
  Duration duration = Duration(seconds: 3);
  String result;
  await Future.delayed(duration, () {
    result = 'Task 2 complete';
    print('Task 2 .......');
  });
  return result;
}

void task3(String taskData2) {
  String result = 'task3 data';
  print('Task 3 complete with $taskData2');
}

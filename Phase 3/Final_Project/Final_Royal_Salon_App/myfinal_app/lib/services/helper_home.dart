import 'package:flutter/material.dart';
import 'package:myfinal_app/models/promo.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/services/todo_service.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/dialogs.dart';
import 'package:provider/provider.dart';

void createNewPromoInUI(BuildContext context,
    {required TextEditingController styleController,
    required TextEditingController discountController,
    required TextEditingController lastdayController}) async {
  if (styleController.text.isEmpty ||
      discountController.text.isEmpty ||
      lastdayController.text.isEmpty) {
    showSnackBar(context, 'Please Enter all fields');
  } else {
    Promo promo = Promo(
      stylename: styleController.text.trim(),
      discount: discountController.text.trim(),
      lastday: lastdayController.text.trim(),
      created: DateTime.now(),
    );
    if (context.read<TodoService>().promos.contains(promo)) {
      showSnackBar(context, 'Duplicate value. Please try again.');
    } else {
      styleController.text = '';
      discountController.text = '';
      lastdayController.text = '';
      context.read<TodoService>().createPromo(promo);
      Navigator.pop(context);
    }
  }
}

void refreshTodosInUI(BuildContext context) async {
  String result = await context.read<TodoService>().getTodos(
        context.read<UserService>().currentUser!.email,
      );
  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Data successfully retrieved from the database.');
  }
}

void refreshPromosInUI(BuildContext context) async {
  String result = await context.read<TodoService>().getPromos(
        context.read<UserService>().currentUser!.email,
      );
  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Data successfully retrieved from the database.');
  }
}

void saveAllTodosInUI(BuildContext context) async {
  String result = await context
      .read<TodoService>()
      .saveTodoEntry(context.read<UserService>().currentUser!.email, true);
  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Data successfully saved online!');
  }
}

void createNewTodoInUI(BuildContext context,
    {required TextEditingController titleController,
    required TextEditingController title1Controller}) async {
  if (titleController.text.isEmpty || title1Controller.text.isEmpty) {
    showSnackBar(context, 'Please Enter all fields');
  } else {
    Todo todo = Todo(
      title: titleController.text.trim(),
      title1: title1Controller.text.trim(),
      created: DateTime.now(),
    );
    if (context.read<TodoService>().todos.contains(todo)) {
      showSnackBar(context, 'Duplicate value. Please try again.');
    } else {
      titleController.text = '';
      title1Controller.text = '';
      context.read<TodoService>().createTodo(todo);
      Navigator.pop(context);
    }
  }
}

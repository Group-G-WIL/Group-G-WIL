import 'package:flutter/material.dart';
import 'package:myfinal_app/models/comm.dart';
import 'package:myfinal_app/models/favou.dart';
import 'package:myfinal_app/models/promo.dart';
import 'package:myfinal_app/models/receipts.dart';
import 'package:myfinal_app/models/rev.dart';
import 'package:myfinal_app/models/temp.dart';
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

void createNewInvoiceInUI(
  BuildContext context, {
  required String stylename,
  required String price,
  required String bookingnumber,
  required String date,
  required String time,
}) async {
  if (stylename.isEmpty) {
    showSnackBar(context, 'No info to capture');
  } else {
    Invoice invoice = Invoice(
      stylename: stylename.trim(),
      price: price.trim(),
      bookingnumber: bookingnumber.trim(),
      date: date.trim(),
      time: time.trim(),
      created: DateTime.now(),
    );
    if (context.read<TodoService>().invoices.contains(invoice)) {
      showSnackBar(context, 'Duplicate value. Please try again.');
    } else {
      stylename = '';
      bookingnumber = '';
      date = '';
      time = '';
      price = '';
      context.read<TodoService>().createInvoice(invoice);
      Navigator.pop(context);
    }
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

void saveAllinvoiceInUI(BuildContext context) async {
  String result = await context
      .read<TodoService>()
      .saveTodoEntry(context.read<UserService>().currentUser!.email, true);
  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Your booking is accepted');
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

void createNewCommentInUI(
  BuildContext context, {
  required String stylename,
  required String rate1,
  required String rate2,
  required String comment1,
}) async {
  if (rate1.isEmpty) {
    showSnackBar(context, 'No data to capture');
  } else {
    Comment comment = Comment(
      stylename: stylename.trim(),
      rate1: rate1.trim(),
      rate2: rate2.trim(),
      comment1: comment1.trim(),
      created: DateTime.now(),
    );
    if (context.read<TodoService>().comments.contains(comment)) {
      showSnackBar(context, 'Duplicate value. Please try again.');
    } else {
      rate1 = '';
      stylename = '';
      rate2 = '';
      context.read<TodoService>().createComment(comment);
      Navigator.pop(context);
    }
  }
}

void createNewReviewInUI(
  BuildContext context, {
  required String stylename,
  required String salonname,
  required String rate1,
  required String rate2,
  required String comment,
}) async {
  if (stylename.isEmpty ||
      salonname.isEmpty ||
      rate1.isEmpty ||
      rate2.isEmpty ||
      comment.isEmpty) {
    showSnackBar(context, 'Please Enter all fields');
  } else {
    Review review = Review(
      comment: comment.trim(),
      salonname: salonname.trim(),
      stylename: stylename.trim(),
      rate1: rate1.trim(),
      rate2: rate2.trim(),
      created: DateTime.now(),
    );
    if (context.read<TodoService>().reviews.contains(review)) {
      showSnackBar(context, 'Duplicate value. Please try again.');
    } else {
      comment = '';
      salonname = '';
      stylename = '';
      rate1 = '';
      rate2 = '';
      context.read<TodoService>().createREview(review);
      Navigator.pop(context);
    }
  }
}

void createNewTempInUI(
  BuildContext context, {
  required String stylename,
  required String salonname,
}) async {
  if (stylename.isEmpty || salonname.isEmpty) {
    showSnackBar(context, 'Please Enter all fields');
  } else {
    Temp temp = Temp(
      salonname: salonname.trim(),
      stylename: stylename.trim(),
      created: DateTime.now(),
    );
    if (context.read<TodoService>().temps.contains(temp)) {
      showSnackBar(context, 'Duplicate value. Please try again.');
    } else {
      salonname = '';
      stylename = '';

      context.read<TodoService>().createTemp(temp);
      Navigator.pop(context);
    }
  }
}

void createNewFavouriteInUI(BuildContext context,
    {required String salonname, required String salonAdress}) async {
  if (salonname.isEmpty || salonAdress.isEmpty) {
    showSnackBar(context, 'Nothing to capture');
  } else {
    Favourite favourite = Favourite(
      stylename: salonname.trim(),
      salonadress: salonAdress.trim(),
      created: DateTime.now(),
    );
    if (context.read<TodoService>().favourites.contains(favourite)) {
      showSnackBar(context, 'Duplicate value. Please try again.');
    } else {
      salonname = '';
      salonAdress = '';
      context.read<TodoService>().createFavourite(favourite);
      Navigator.pop(context);
    }
  }
}

import 'package:backendless_sdk/backendless_sdk.dart';

import 'package:flutter/material.dart';
import 'package:myfinal_app/lifecycle.dart';
import 'package:myfinal_app/models/comm.dart';
import 'package:myfinal_app/models/favou.dart';
import 'package:myfinal_app/models/promo.dart';
import 'package:myfinal_app/models/receipts.dart';
import 'package:myfinal_app/models/rev.dart';
import 'package:myfinal_app/models/temp.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/models/todo_entry.dart';

class TodoService with ChangeNotifier {
  TodoEntry? _todoEntry;
  //TodoEntry? _promoEntry;

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  void emptyTodos() {
    _todos = [];
    notifyListeners();
  }

  List<Promo> _promos = [];
  List<Promo> get promos => _promos;

  void emptyPromos() {
    _promos = [];
    notifyListeners();
  }

  List<Invoice> _invoices = [];
  List<Invoice> get invoices => _invoices;
  void emptyInvoices() {
    _invoices = [];
    notifyListeners();
  }

  List<Comment> _comments = [];
  List<Comment> get comments => _comments;

  void emptyComment() {
    _comments = [];
    notifyListeners();
  }

  List<Review> _reviews = [];
  List<Review> get reviews => _reviews;

  void emptyReview() {
    _reviews = [];
    notifyListeners();
  }

  List<Favourite> _favourites = [];
  List<Favourite> get favourites => _favourites;

  void emptyFavourites() {
    _favourites = [];
    notifyListeners();
  }

  List<Temp> _temps = [];
  List<Temp> get temps => _temps;

  void emptyTemp() {
    _temps = [];
    notifyListeners();
  }

  bool _busyRetrieving = false;
  bool _busySaving = false;

  bool get busyRetrieving => _busyRetrieving;
  bool get busySaving => _busySaving;

  bool _busyRetrieving1 = false;
  bool _busySaving1 = false;

  bool get busyRetrieving1 => _busyRetrieving1;
  bool get busySaving1 => _busySaving1;

//
  Future<String> getTodos(String username) async {
    String result = 'OK';
    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "username = '$username'";

    _busyRetrieving = true;
    notifyListeners();

    List<Map<dynamic, dynamic>?>? map = await Backendless.data
        .of('TodoEntry')
        .find(queryBuilder)
        .onError((error, stackTrace) {
      result = error.toString();
    });

    if (result != 'OK') {
      _busyRetrieving = false;
      notifyListeners();
      return result;
    }

    if (map != null) {
      if (map.length > 0) {
        _todoEntry = TodoEntry.fromJson(map.first);

        _todos = convertMapToTodoList(_todoEntry!.todos);

        notifyListeners();
      } else {
        emptyTodos();
      }
    } else {
      result = 'NOT OK';
    }

    _busyRetrieving = false;
    notifyListeners();

    return result;
  }

//
  Future<String> getPromos(String username) async {
    String result = 'OK';
    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "username = '$username'";

    _busyRetrieving1 = true;
    notifyListeners();

    List<Map<dynamic, dynamic>?>? map = await Backendless.data
        .of('TodoEntry')
        .find(queryBuilder)
        .onError((error, stackTrace) {
      result = error.toString();
    });

    if (result != 'OK') {
      _busyRetrieving1 = false;
      notifyListeners();
      return result;
    }

    if (map != null) {
      if (map.length > 0) {
        _todoEntry = TodoEntry.fromJson(map.first);

        _promos = convertMapToPromoList(_todoEntry!.promos);
        notifyListeners();
      } else {
        emptyPromos();
      }
    } else {
      result = 'NOT OK';
    }

    _busyRetrieving1 = false;
    notifyListeners();

    return result;
  }

  Future<String> saveTodoEntry(String username, bool inUI) async {
    String result = 'OK';
    if (_todoEntry == null) {
      _todoEntry = TodoEntry(
          todos: convertTodoListToMap(_todos),
          promos: convertPromoListToMap(_promos),
          invoices: convertinvoicesListToMap(_invoices),
          comments: convertCommentListToMap(_comments),
          reviews: convertReviewListToMap(_reviews),
          favourites: convertFavouriteListToMap(_favourites),
          temps: convertTempListToMap(_temps),
          username: username);
    } else {
      _todoEntry!.todos = convertTodoListToMap(_todos);
      _todoEntry!.promos = convertPromoListToMap(_promos);
      _todoEntry!.invoices = convertinvoicesListToMap(_invoices);
      _todoEntry!.comments = convertCommentListToMap(_comments);
      _todoEntry!.reviews = convertReviewListToMap(_reviews);
      _todoEntry!.favourites = convertFavouriteListToMap(_favourites);
      _todoEntry!.temps = convertTempListToMap(_temps);
    }

    if (inUI) {
      _busySaving = true;
      notifyListeners();
    }
    await Backendless.data
        .of('TodoEntry')
        .save(_todoEntry!.toJson())
        .onError((error, stackTrace) {
      result = error.toString();
    });
    if (inUI) {
      _busySaving = false;
      notifyListeners();
    }

    return result;
  }

  void toggleTodoDone(int index) {
    _todos[index].done = !_todos[index].done;

    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void togglePromoDone(int index) {
    _promos[index].done = !_promos[index].done;
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void toggleInvoiceDone(int index) {
    _invoices[index].done = !_invoices[index].done;
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void deleteComment(Comment comment) {
    _comments.remove(comment);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void deleteFavourite(Favourite favourite) {
    _favourites.remove(favourite);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void deleteReview(Review review) {
    _reviews.remove(review);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void deletePromo(Promo promo) {
    _promos.remove(promo);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void deleteInvoice(Invoice invoice) {
    _invoices.remove(invoice);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void createTodo(Todo todo) {
    _todos.insert(0, todo);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void createPromo(Promo promo) {
    _promos.insert(0, promo);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void createInvoice(Invoice invoice) {
    _invoices.insert(0, invoice);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void createFavourite(Favourite favourite) {
    _favourites.insert(0, favourite);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void createREview(Review review) {
    _reviews.insert(0, review);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void createComment(Comment comment) {
    _comments.insert(0, comment);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }

  void createTemp(Temp temp) {
    _temps.insert(0, temp);
    notifyListeners();
    setUIStateFlag(UIState.CHANGED);
  }
}

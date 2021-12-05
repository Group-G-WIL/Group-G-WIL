import 'package:flutter/material.dart';
import 'package:myfinal_app/services/todo_service.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/app_progress_indicator.dart';
import 'package:myfinal_app/widgets/promos_card.dart';
import 'package:myfinal_app/widgets/services_card.dart';
import 'package:provider/provider.dart' as provider;
import 'package:tuple/tuple.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurpleAccent, Colors.blue],
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Text(
                    'Services List',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: provider.Consumer<TodoService>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.todos.length,
                            itemBuilder: (context, index) {
                              return DisplayServices(
                                todo: value.todos[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    'Our Promotions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: provider.Consumer<TodoService>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.promos.length,
                            itemBuilder: (context, index) {
                              return DisplayPromo(
                                promo: value.promos[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

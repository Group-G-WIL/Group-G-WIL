import 'package:myfinal_app/services/todo_service.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/app_progress_indicator.dart';
import 'package:myfinal_app/widgets/booking_salon.dart';
import 'package:myfinal_app/widgets/bookings_client.dart';
import 'package:myfinal_app/widgets/comment_card.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ViewComment extends StatelessWidget {
  const ViewComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Text(
                    'Client Reviews',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
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
                            itemCount: value.comments.length,
                            itemBuilder: (context, index) {
                              return CommentCard(
                                comment: value.comments[index],
                                // todoToggleAction: (valueStatus) async {
                                //   context
                                //       .read<TodoService>()
                                //       .toggleTodoDone(index);
                                // },
                                deleteAction: () async {
                                  context
                                      .read<TodoService>()
                                      .deleteComment(value.comments[index]);
                                },
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
            provider.Selector<UserService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.showUserProgress, value.userProgressText),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(text: value.item2)
                    : Container();
              },
            ),
            provider.Selector<TodoService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.busyRetrieving, value.busySaving),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(
                        text:
                            'Busy retrieving data from the database...please wait...')
                    : value.item2
                        ? AppProgressIndicator(
                            text:
                                'Busy saving data to the database...please wait...')
                        : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

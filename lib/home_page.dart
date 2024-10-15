import 'package:api_learning_day_1/add_user_page.dart';
import 'package:api_learning_day_1/api_fahri.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => AddUserPage(),));
              },
              child: Text('Add user API'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => PageApiOne(),));
            }, child: Text('API 2')),
                    ],
                  ),
          )),
    );
  }
}

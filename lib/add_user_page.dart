import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as myHttp;

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {

  String name = '';
  String email = '';
  String imageUrl = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Post API',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name'),
            TextField(),
            // Email User
            const SizedBox(
              height: 20,
            ),
            Text('Last Name'),
            TextField(),
            const SizedBox(
              height: 20,
            ),
            // Password user
            Text('E-mail'),
            TextField(),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      addUsers();
                    },
                    child: Text('Add User')))
          ],
        ),
      )),
    );
  }

  Future<void> addUsers() async {
    setState(() => isLoading = true);

    try {
      var response = await myHttp.post(
          Uri.parse('https://reqres.in/api/users?page=1'),
          body: {'first_name': name, 'email': email, 'avatar': imageUrl});

      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User added : ${jsonResponse['first_name']}')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add user : ${response.body}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error ocurred : $e')));
    }
    setState(
      () => isLoading = false,
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as myHttp;

// class ApiFahri extends StatefulWidget {
//   const ApiFahri({super.key});

//   @override
//   State<ApiFahri> createState() => _ApiFahriState();
// }

// class _ApiFahriState extends State<ApiFahri> {
//   List<dynamic> product = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Product'),
//       ),
//       body: SafeArea(
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//           ),
//           itemCount: product.length,
//           itemBuilder: (context, index) {
//             final itemData = product[index];
//             final title = itemData['title'];
//             final images = itemData['image'];
//             final harga = itemData['price'];

//             return Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Image.network(
//                       images,
//                       height: 100,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Price: \$${harga.toString()}'
//                       ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ConvertDataJson();
//         },
//         child: Icon(Icons.download),
//       ),
//     );
//   }

//   void ConvertDataJson() async {
//     final url = 'https://fakestoreapi.com/products';
//     final uri = Uri.parse(url);
//     final response = await myHttp.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     setState(() {
//       product = json;
//     });
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageApiOne extends StatefulWidget {
  const PageApiOne({super.key});

  @override
  State<PageApiOne> createState() => _PageApiOneState();
}

class _PageApiOneState extends State<PageApiOne> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users List with Avatar',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final avatarUrl = user['avatar'];
                final name = user['first_name'] + ' ' + user['last_name'];
                final email = user['email'];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  title: Text(name),
                  subtitle: Text(email),
                );
              },
            ),
    );
  }

  void fetchData() async {
    const url = 'https://reqres.in/api/users?page=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['data'];
    });
  }
}

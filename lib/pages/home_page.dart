import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:prueba_tecnica_ueno/models/user.dart';
import 'package:prueba_tecnica_ueno/pages/active_client_page.dart';
import 'package:prueba_tecnica_ueno/pages/blocked_client_page.dart';
import 'package:prueba_tecnica_ueno/pages/inactive_client_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _isLoading = true;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userList = data['data'] as List;
        setState(() {
          _users = userList.map((userData) => User.fromJson(userData)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de clientes'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return InkWell(
                    onTap: () {
                      _selectClient(user);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(
                        user.email,
                        style: const TextStyle(
                          color: Color(0xFF20CFA0),
                        ),
                      ),
                    ),
                  );
                },
              )),
    );
  }

  void _selectClient(User user) {
    final randomNumber = generateRandomNumber();
    if (randomNumber < 20) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ActiveClientPage(user),
        ),
      );
    } else if (randomNumber % 20 == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InactiveClientPage(user),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlockedClientPage(user),
        ),
      );
    }
  }

  int generateRandomNumber() {
    final random = Random();
    return random.nextInt(100) + 1;
  }
}

import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  bool _isValidUsername(String username) {
    return !username.contains(RegExp(r'[0-9]'));
  }

  bool _isValidPassword(String password) {
    return password.length == 5;
  }

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (_isValidUsername(username) && _isValidPassword(password)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Nombre de usuario o contraseña no válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
              keyboardType: TextInputType.number,
              maxLength: 5,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Ingresar'),
            ),
            Text(
              _errorMessage,
              style: const TextStyle(color: Color(0xFFFF1100)),
            ),
          ],
        ),
      ),
    );
  }
}
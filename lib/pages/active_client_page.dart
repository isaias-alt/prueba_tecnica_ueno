import 'package:flutter/material.dart';

import '../models/user.dart';

class ActiveClientPage extends StatelessWidget {
  final User user;

  const ActiveClientPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente Activo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  '${user.firstName} ${user.lastName} es un cliente activo.',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF20CFA0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
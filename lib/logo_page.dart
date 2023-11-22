import 'package:flutter/material.dart';
class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          const Text('Welcome',style: TextStyle(fontSize: 30),),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Enter'),
          ),
        ],
      )

    );
  }
}

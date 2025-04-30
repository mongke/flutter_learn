import 'package:flutter/material.dart';

class HomeScreenWelcome extends StatefulWidget {
  const HomeScreenWelcome({super.key});

  @override
  State<HomeScreenWelcome> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your navigation or action here
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
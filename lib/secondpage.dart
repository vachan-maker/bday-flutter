import 'package:flutter/material.dart';

class BirthdayPage extends StatelessWidget {
  final String nameOfUser;
  final DateTime? dateOfUser;

  const BirthdayPage({
    required this.nameOfUser,
    required this.dateOfUser,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green
                  ], // Specify your gradient colors
                  begin: Alignment
                      .topCenter, // Optional: Start point of the gradient
                  end: Alignment
                      .bottomCenter, // Optional: End point of the gradient
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.99,
              height: MediaQuery.of(context).size.height * 0.65,
              child: Center(
                child: Text(
                  'Hey $nameOfUser You are this old.',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Add other widgets as needed
          ],
        ),
      ),
    );
  }
}

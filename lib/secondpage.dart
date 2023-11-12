import 'package:flutter/material.dart';

class BirthdayPage extends StatelessWidget {
  final String nameOfUser;
  final DateTime dateOfUser;

  BirthdayPage({
    required this.nameOfUser,
    required this.dateOfUser,
  });

  String calculateAge() {
    DateTime now = DateTime.now();
    int years = now.year - dateOfUser.year;
    int months = now.month - dateOfUser.month;

    if (now.day < dateOfUser.day) {
      months--;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return '$years years and $months months old';
  }

  @override
  Widget build(BuildContext context) {
    String age = calculateAge();
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
                  'Hey $nameOfUser You are $age',
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Info',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  final _dateController = TextEditingController();
  String nameOfUser = " ";
  DateTime? dateOfUser;
  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Birthday"),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
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
                child: const Center(
                  child: Text(
                    'Your birthday is more than just \n a day in the calendar!',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: SizeConfig().heightSize(context, 15.0),
                width: SizeConfig().heightSize(context, 90),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "First Name",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _textController.clear();
                          },
                          icon: const Icon(Icons.clear))),
                  controller: _textController,
                ),
              ),
              Container(
                height: SizeConfig().heightSize(context, 15.0),
                width: SizeConfig().heightSize(context, 90),
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),
              FilledButton.tonal(
                  onPressed: () {
                    nameOfUser = _textController.text;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BirthdayPage(
                              nameOfUser: nameOfUser,
                              dateOfUser: dateOfUser,
                            )));
                  },
                  child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? dateOfUser = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (dateOfUser != null) {
      _dateController.text = DateFormat('yyyy-MM-dd').format(dateOfUser);
    }
  }
}

class SizeConfig {
  double heightSize(BuildContext context, double value) {
    value /= 100;
    return MediaQuery.of(context).size.height * value;
  }

  double widthSize(BuildContext context, double value) {
    value /= 100;
    return MediaQuery.of(context).size.width * value;
  }
}

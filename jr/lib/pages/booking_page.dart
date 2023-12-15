import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'signup.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _nameController = TextEditingController();
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _nameController.dispose();
    _departureController.dispose();
    _destinationController.dispose();

    super.dispose();
  }

  /* Future signUp() async {
    bool passwordConfirmed() {
      if (_passwordTextController.text.trim() ==
          _passwordTextController.text.trim()) {
        return true;
      } else {
        return false;
      }
    }

    Future addUserDetails(
        String name, String departure, String destination) async {
      await FirebaseFirestore.instance.collection('booking').add({
        'name': name,
        'departure': departure,
        'destination': destination,
      });
    }

// authenticate user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _emailTextController.text.trim(),
      );
      //Add user details

      addUserDetails(
        _nameController.text.trim(),
        _departureController.text.trim(),
        _destinationController.text.trim(),
      );
    }
  }*/

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      key: const Key('name'),
      controller: _nameController,
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
    );
  }

  Widget _buildDeparture() {
    return TextFormField(
      controller: _departureController,
      decoration: const InputDecoration(labelText: 'Departure'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter departure time';
        }
        return null;
      },
    );
  }

  Widget _buildDestination() {
    return TextFormField(
      controller: _destinationController,
      decoration: const InputDecoration(labelText: 'Destination'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid destination';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('BOOKING', style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildDeparture(),
                _buildDestination(),
                const SizedBox(height: 100),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                  onPressed: () {
                    CollectionReference collRef =
                        FirebaseFirestore.instance.collection('booking');
                    collRef.add({
                      'name': _nameController.text,
                      'departure': _departureController.text,
                      'destination': _destinationController.text,
                      'userID': (currentUser?.uid).toString()
                    });
                    Navigator.pushNamed(context, 'receipt');
                  },
                  child: const Text(
                    key: Key('booking'),
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

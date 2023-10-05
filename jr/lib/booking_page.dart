import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  String _name = '';
  String _date = '';
  String _departure = '';
  String _destination = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
      onSaved: (String? value) {
        _name = value ?? '';
      },
    );
  }

  Widget _buildDate() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Date'),
      keyboardType: TextInputType.datetime,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid date';
        }
        return null;
      },
      onSaved: (String? value) {
        _date = value ?? '';
      },
    );
  }

  Widget _buildDeparture() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Departure'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter departure time';
        }
        return null;
      },
      onSaved: (String? value) {
        _departure = value ?? '';
      },
    );
  }

  Widget _buildDestination() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Destination'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid destination';
        }
        return null;
      },
      onSaved: (String? value) {
        _destination = value ?? '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Booking Page'),
        ),
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildDate(),
                _buildDeparture(),
                _buildDestination(),
                const SizedBox(height: 100),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow)
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white, fontSize: 16,),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print(_name);
                      print(_date);
                      print(_departure);
                      print(_destination);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

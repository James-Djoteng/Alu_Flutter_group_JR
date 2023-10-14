import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  GetUserName({required this.documentId});
  @override
  Widget build(BuildContext context) {
// get the collection
    CollectionReference booking =
        FirebaseFirestore.instance.collection('booking');
    return FutureBuilder<DocumentSnapshot>(
        future: booking.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return SizedBox(
              height: 400,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      'Name: ${data['name']}\nDeparture: ${data['departure']}\nDestination: ${data['destination']}'),
                ],
              ),
            );
          }
          return const Text('Loading...');
        })); // FutureBuilder
  }
}

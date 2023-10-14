import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../read data/get_user_name.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  // document IDs
  List<String> docIDs = [];

// get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('booking')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(builder: (context, snapchot) {
        return ListView.builder(
            itemCount: docIDs.length,
            itemBuilder: (context, Index) {
              return ListTile(
                title: GetUserName(documentId: docIDs[Index]),
              );
            });
      }),
    );
  }
}

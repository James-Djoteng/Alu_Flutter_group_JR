import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../read data/get_user_name.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  final formKey = GlobalKey<FormState>();
  final bookingController = TextEditingController();

  List<String> bookingFromDB = [];
  // document IDs
  List documentIds = [];
  String newDestination = '';
  String newDestinationDB = '';
  String userID = '';

// get docIDs
  Future getDocId() async {
    userID = (FirebaseAuth.instance.currentUser?.uid).toString();
    documentIds.clear();
    bookingFromDB.clear();
    await FirebaseFirestore.instance
        .collection('booking')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              if (element.data().containsValue(userID)) {
                print(element.reference);

                documentIds.add(element.id);
                bookingFromDB.add(element.data().toString());
              }
            }));
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await getDocId();
    // setState triggers a rebuild with the new data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before_outlined,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        title: const Text(
          'RECEIPT',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            key: const Key('receipt'),
            future: Future<void>.value(),
            builder: (context, snapchot) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: bookingFromDB.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(
                              (bookingFromDB[index]).toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  wordSpacing: 20),
                            ),
                            IconButton(
                                onPressed: () async {
                                  try {
                                    await FirebaseFirestore.instance
                                        .collection('booking')
                                        .doc(documentIds[index].toString())
                                        .delete();
                                    print('DOCUMENT DELETED');

                                    // Fetch updated data after deletion
                                    await _loadData();

                                    // Clear lists only after successful deletion and data update
                                  } catch (e) {
                                    print('Error Deleting Document: $e');
                                  }
                                },
                                icon: const Icon(Icons.delete_rounded)),
                            //Update Button
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => SimpleDialog(
                                            children: [
                                              Title(
                                                  color: Colors.yellow,
                                                  child: const Text(
                                                      'Change Your Destination Here')),
                                              TextField(
                                                onChanged: (value) {
                                                  newDestination =
                                                      '{Destination: $value}';
                                                  newDestinationDB = value;
                                                },
                                              ),
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    bookingFromDB[index] =
                                                        newDestination;
                                                    final changed = {
                                                      'destination':
                                                          newDestinationDB
                                                    };

                                                    try {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('booking')
                                                          .doc(
                                                              documentIds[index]
                                                                  .toString())
                                                          .set(
                                                              changed,
                                                              SetOptions(
                                                                  merge: true));
                                                      Navigator.pop(context);

                                                      // Fetch updated data after deletion
                                                      await _loadData();

                                                      // Clear lists only after successful deletion and data update
                                                    } catch (e) {
                                                      print(
                                                          'Error Updating Document: $e');
                                                    }
                                                  },
                                                  child: const Text('Update'))
                                            ],
                                          ));
                                },
                                icon: const Icon(Icons.update_rounded))
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

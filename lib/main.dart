import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirestoreTestScreen(),
    );
  }
}

class FirestoreTestScreen extends StatelessWidget {
  final CollectionReference servicesCollection =
  FirebaseFirestore.instance.collection('services');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: servicesCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            return Center(child: Text('No data found in the collection.'));
          }

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var data = documents[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: Image.asset(
                  data['iconPath'] ?? 'assets/icons/default_icon.png',
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                ),
                title: Text(data['title'] ?? 'No Title'),
                subtitle: Text(data['description'] ?? 'No Description'),
              );
            },
          );
        },
      ),
    );
  }
}
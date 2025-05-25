import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/service.dart';

class ServiceRepository {
  final CollectionReference _servicesCollection = FirebaseFirestore.instance
      .collection('services');

  Stream<List<Service>> getServices() {
    return _servicesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Service.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}

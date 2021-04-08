import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService{

  // collection reference
  final CollectionReference taskCollection = FirebaseFirestore.instance.collection('tasks');
}
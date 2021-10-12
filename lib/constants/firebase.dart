import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


final Future<FirebaseApp> initialization = Firebase.initializeApp();
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WrapperIsNew extends StatelessWidget {
  const WrapperIsNew({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('user');
    return FutureBuilder(
        future: Future.delayed(
            const Duration(seconds: 1),
            () => collectionRef
                .where(
                  'id',
                  isEqualTo: FirebaseAuth.instance.currentUser != null
                      ? FirebaseAuth.instance.currentUser!.uid
                      : 1,
                )
                .get()),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.hasData) {
            final documents = snapshot.data!.docs;

            if (documents.isNotEmpty) {
              final data = documents.first.data() as Map<String, dynamic>;
              return data['role'] == 'admin'
                  ? Routes.goAdmin()
                  : Routes.goHome();
            } else {
              return Routes.goLogin();
            }
          }

          return const Scaffold();
        });
  }
}

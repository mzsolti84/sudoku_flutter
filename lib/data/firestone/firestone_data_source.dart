import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:sudoku_flutter/domain/model/game_user.dart';

@lazySingleton
class FirestoneDataSource {
  final _firestore = FirebaseFirestore.instance;

  Future updateUsersCollection(GameUser user) {
    var data = {
      'email': user.email,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'age': user.age,
    };
    return _firestore.collection('users').doc(user.id).set(data);
  }

  Stream<List<GameUser>> findAllUser() {
    return _firestore.collection('users').snapshots().map((event) => event.docs
        .map(
          (element) => GameUser(
            id: element.id,
            email: element.get('email'),
            firstName: element.get('firstName'),
            lastName: element.get('lastName'),
            age: element.get('age'),
          ),
        )
        .toList()
    );
  }

  Future<GameUser?> findUserByUid(String uid) async {
    var docSnapshot = await _firestore.collection('users').doc(uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      final int age = data?['age'];
      final String email = data?['email'];
      final String firstname = data?['firstName'];
      final String lastname = data?['lastName'];
      final user = GameUser(id: uid, email: email, firstName: firstname, lastName: lastname, age: age);
      debugPrint(user.toString());
      return user;
    }
      return null;
  }
}

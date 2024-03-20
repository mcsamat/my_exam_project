import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirestoreUser {
  final String email;
  final String password;
  final String photoUrl;
  final String name;
  final String surname;
  final String group;
  final List availableLocalEvents;
  final List availableNationalEvents;
  final List chosenEvents;
  final bool isBoss;

  const MyFirestoreUser(
      {required this.email,
      required this.password,
      required this.photoUrl,
      required this.name,
      required this.surname,
      required this.group,
      required this.availableLocalEvents,
      required this.availableNationalEvents,
      required this.chosenEvents,
      required this.isBoss});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'photoUrl': photoUrl,
        'name': name,
        'surname': surname,
        'group': group,
        'availableLocalEvents': availableLocalEvents,
        'availableNationalEvents': availableNationalEvents,
        'chosenEvents': chosenEvents,
        'isBoss': isBoss,
      };
  static MyFirestoreUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return MyFirestoreUser(
      email: snapshot['email'],
      password: snapshot['password'],
      photoUrl: snapshot['photoUrl'],
      name: snapshot['name'],
      surname: snapshot['surname'],
      group: snapshot['group'],
      availableLocalEvents: snapshot['availableLocalEvents'],
      availableNationalEvents: snapshot['availableNationalEvents'],
      chosenEvents: snapshot['chosenEvents'],
      isBoss: snapshot['isBoss'],
    );
  }
}

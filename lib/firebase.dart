import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firebaseefunc {
  static adduser(String name, String cnumber
      ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    final docs = FirebaseFirestore.instance.collection('Users');
    final json = {
      'Name': name,
      'Contact Number': cnumber,
      'uid': uid,
    };
    print("Added");
    await docs.add(json);
  }

  static String whatuid() {
    FirebaseAuth auth = FirebaseAuth.instance;

    String uid = auth.currentUser!.uid.toString();
    return uid;
  }

  static List<Myusers> transactions = [];
  static Future<List<Myusers>> getdata() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .get()
        .then((snapshort) => snapshort.docs.forEach((element) {
              var transactionsinfo = element.data() as Map<String, dynamic>;
           
              String myuid = whatuid();

              // if (myuid == transactionsinfo["uid"]) {
                transactions.add(Myusers(
                    name: transactionsinfo["Name"] ?? "",
                    cnumber: transactionsinfo["Contact Number"] ?? "",
                    uid: transactionsinfo["uid"] ?? ""));
              // }
            }))
        .catchError((err) => print("err is" + err.toString()));
    // print(transactions.length);
    // setState(() {
    //   load = true;
    // });
    return transactions;
  }
}

class Myusers {
  final String name;
  final String cnumber;

  final String uid;
  Myusers({
    required this.name,
    required this.cnumber,
    required this.uid,
  });
}

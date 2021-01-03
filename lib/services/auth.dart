import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e){
      return e.message;
    } catch (error) {
      print(error.toString());
    }
  }
  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e){
      return e.message;
    } catch (error) {
      print(error.toString());
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}




/**
 * 
 */

// add some ref
                // DocumentReference test = db.collection("cart").doc("user");
                // db
                //     .collection("test")
                //     .add({"ref": test, "num": 12})
                //     .then((value) => Scaffold.of(context).showSnackBar(SnackBar(
                //           content: Text('done'),
                //           duration: const Duration(seconds: 2),
                //         )))
                //     .catchError((e) => print(e.toString()));
                //---------------------------------------------------------------------
                // List<DocumentReference> a;
                // db
                //     .collection("test")
                //     .get()
                //     .then((QuerySnapshot querySnapshot) => {
                //           querySnapshot.docs.forEach((doc) {
                //             a.add(doc["ref"]);
                //           })
                //         });
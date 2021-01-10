import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //stream to check user auth or not 
  Stream<User> get getUser {
    return _auth.authStateChanges();
  }
  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } on FirebaseAuthException catch (e){

      print("Firebase auth exeption : ${e.toString()}");
      return null;
    } catch (error) {
      print("erron in auth : ${error.toString()}");
      return null;
    }
  }
  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
       UserCredential result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } on FirebaseAuthException catch (e){
      print("Firebase register exeption : ${e.toString()}");
      return null;
    } catch (error) {
     print("erron in register : ${error.toString()}");
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
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
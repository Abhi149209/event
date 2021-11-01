import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
final FirebaseAuth _auth=FirebaseAuth.instance;
final GoogleSignIn googleSignIn=GoogleSignIn();

String email="";

Future<UserCredential> signInWithUser() async {
  print("kjbfvF");
  final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
   print("jarg");
  final GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;

  final
  OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken
  );
  Fluttertoast.showToast(msg: "Account created");
  return await FirebaseAuth.instance.signInWithCredential(credential);


}
//
// Future<User?> signInWithUser() async {
//   await Firebase.initializeApp();
//
//   final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
//   final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
//
//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication?.accessToken,
//     idToken: googleSignInAuthentication?.idToken,
//   );
//
//   final UserCredential userCredential = await _auth.signInWithCredential(credential);
//   final User? user = userCredential.user;
//
//   if (user != null) {
//     // Checking if email and name is null
//     assert(user.uid != null);
//     assert(user.email != null);
//     assert(user.displayName != null);
//     assert(user.photoURL != null);
//     //
//     // uid = user.uid;
//     // name = user.displayName;
//     // userEmail = user.email;
//     // imageUrl = user.photoURL;
//
//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);
//
//     final User? currentUser = _auth.currentUser;
//     assert(user.uid == currentUser?.uid);
//
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//    // prefs.setBool('auth', true);
//
//     return user;
//   }
//   return null;
//
//
//   // final GoogleSignInAccount? googleSignInAccount=await GoogleSignIn().signIn();
//   //
//   // final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
//   //
//   // final credential = GoogleAuthProvider.credential(
//   //   accessToken: googleSignInAuthentication?.accessToken,
//   //   idToken: googleSignInAuthentication?.idToken,
//   // );
//   // final UserCredential authresult = await _auth.signInWithCredential(credential);
//   // final User user =authresult.user!;
//   // //assert(user.email!=null);
//   // assert(!user.isAnonymous);
//   // assert(await user.getIdToken()!=null);
//   //
//   // final User currentUser=_auth.currentUser!;
//   // assert(currentUser.uid==user.uid);
//   // return user;
//
//




//}

void signOutGoogle() async {
  await googleSignIn.signOut();
}
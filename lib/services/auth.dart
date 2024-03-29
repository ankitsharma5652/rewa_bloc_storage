import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: ['email'], signInOption: SignInOption.standard);
  final fire = Firestore.instance;
  final usersRef = Firestore.instance.collection('users');

  Stream<FirebaseUser> get state => _auth.onAuthStateChanged;

  Future handleGoogleSignin() async {
   /* GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    if (googleUser == null) throw 'Authentication aborted';
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    return _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );*/

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return user;
  }


  Future<bool> _checkUserExists(FirebaseUser user) async {
    var userDoc = await usersRef.document(user.uid).get();
    return userDoc.exists;
  }

  Future<void> _createUser(FirebaseUser user) => usersRef.document(user.uid).setData({
        'username': user.displayName,
        'email': user.email,
        'imageUrl': user.photoUrl,
      });

  Future<DocumentReference> handleUserLoggedIn(FirebaseUser user) {
    return _checkUserExists(user).then((exists) async {
      if (!exists) await _createUser(user);
      return usersRef.document(user.uid);
    });
  }

  void handleSignOut() {
    _auth.signOut();
    _googleSignIn.signOut();
  }
}

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser();
  }

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }
}

import 'package:devmet/data_layer/utility/cache_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../models/auth_model.dart';

part 'auth_failures.dart';

class AuthRepository {
  AuthRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    CacheClient? cache,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _cache = cache ?? CacheClient(),
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final CacheClient _cache;

  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  Stream<LocalUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? LocalUser.empty : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  LocalUser get currentUser =>
      _cache.read<LocalUser>(key: userCacheKey) ?? LocalUser.empty;

  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw LoginWithGoogleError.fromCode(e.code);
    } catch (_) {
      throw const LoginWithGoogleError();
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutError();
    }
  }


  //Modification of deleting user account soon
  Future<void> deleteUserAccount() async {
    try {
      late final AuthCredential credential;
      final googleUser = await GoogleSignIn.standard().signIn();
      final googleAuth = await googleUser!.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);

      await FirebaseAuth.instance.currentUser!.delete();
      // context.read<AppBloc>().add(AppLogoutRequested());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        // notificationDialog(
        //     context: context,
        //     notificationMessage: "Requires a recent login",
        //     icon: const Icon(
        //       Icons.cancel,
        //       color: Colors.red,
        //     ));
      } else {
        // notificationDialog(
        //     context: context,
        //     notificationMessage: "An error occured",
        //     icon: const Icon(
        //       Icons.cancel,
        //       color: Colors.red,
        //     ));
      }
    }
  }
}

extension on firebase_auth.User {
  LocalUser get toUser {
    return LocalUser(id: uid, email: email, name: displayName, photo: photoURL);
  }
}

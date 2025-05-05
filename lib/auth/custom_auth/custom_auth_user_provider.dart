import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class EntregasAuthUser {
  EntregasAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<EntregasAuthUser> entregasAuthUserSubject =
    BehaviorSubject.seeded(EntregasAuthUser(loggedIn: false));
Stream<EntregasAuthUser> entregasAuthUserStream() => entregasAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);

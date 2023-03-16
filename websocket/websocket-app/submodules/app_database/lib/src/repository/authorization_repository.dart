import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

@singleton
class AuthorizationRepository {
  static const authorizationBox = 'authorizationBox';
  static const authorizationKey = 'authorizationKey';

  final BehaviorSubject<bool> _isUserLoggedIn =
      BehaviorSubject<bool>.seeded(false);

  final logger = Logger();

  BehaviorSubject<bool> isUserLoggedIn() => _isUserLoggedIn;

  void checkForUserLoggedIn() async {
    var box = await Hive.openBox(AuthorizationRepository.authorizationBox);
    if (box.containsKey(AuthorizationRepository.authorizationKey)) {
      _isUserLoggedIn.add(true);
    }
  }

  Future<String?> authorization() async {
    var box = await Hive.openBox(AuthorizationRepository.authorizationBox);
    if (box.containsKey(AuthorizationRepository.authorizationKey)) {
      return box.get(AuthorizationRepository.authorizationKey);
    }
    return null;
  }

  Future<bool> updateAuthorization(String authorization) async {
    try {
      var box = await Hive.openBox(AuthorizationRepository.authorizationBox);
      await box.put(AuthorizationRepository.authorizationKey, authorization);
      _isUserLoggedIn.add(true);
      return true;
    } catch (error) {
      logger.log(Level.error, error);
    }
    return false;
  }

  Future<void> logout() async {
    var box = await Hive.openBox(AuthorizationRepository.authorizationBox);
    if (box.containsKey(AuthorizationRepository.authorizationKey)) {
      await box.delete(AuthorizationRepository.authorizationKey);
    }
    _isUserLoggedIn.add(false);
  }
}

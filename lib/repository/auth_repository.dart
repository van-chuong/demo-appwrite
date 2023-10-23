import 'package:mobile_app/provider/appwrite_provider.dart';
import 'package:appwrite/models.dart' as models;

class AuthRepository {
  final AppWriteProvider appWriteProvider;
  AuthRepository(this.appWriteProvider);
  Future<models.Session> logIn(Map map) => appWriteProvider.login(map);
  Future logOut() => appWriteProvider.logout();
  Future<models.User> getCurrentUser() => appWriteProvider.getCurrentUser();
  Future<models.DocumentList?> getTrashType() => appWriteProvider.getTrashType();
}

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

import '../utils/appwrite_constants.dart';

class AppWriteProvider {
  Client client = Client();
  Account? account;
  Databases? database;
  AppWriteProvider() {
    client
        .setEndpoint(AppWriteConstants.endPoint)
        .setProject(AppWriteConstants.projectID)
        .setSelfSigned(status: true);
    account = Account(client);
    database = Databases(client);
  }
  Future<models.Session> login(Map map) async {
    return await account!
        .createEmailSession(email: map['email'], password: map['password']);
  }

  Future logout() async {
    return await account!.deleteSession(sessionId: 'current');
  }

  Future<models.User> getCurrentUser() async {
    return await account!.get();
  }
  Future<models.DocumentList?> getTrashType() async {
    try {
      final documents = await database!.listDocuments(
            databaseId: AppWriteConstants.databaseID,
          collectionId: AppWriteConstants.trashTypeCollectionID,
      );
      return documents;
    } on AppwriteException catch(e) {
      print(e);
      return null;
    }
  }
}

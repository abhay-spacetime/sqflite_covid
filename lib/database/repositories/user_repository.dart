
import '../dbhelper.dart';
import '../model/user_model.dart';
import '../util.dart';

class UserRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<UserModel>> getUser() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(tableName,
        columns: ['id', 'firstName', 'lastName', 'userName', 'password']);
    List<UserModel> users = [];
    for (int i = 0; i < maps.length; i++) {
      users.add(UserModel.fromMap(maps[i]));
    }
    return users;
  }

  Future<int> add(UserModel userModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, userModel.toMap());
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  
}

import 'package:flutter_sqflite/database/DBHelper.dart';
import 'package:flutter_sqflite/database/Util.dart';
import 'package:flutter_sqflite/model/UserModel.dart';

class UserRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<UserModel>> getUser() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(tableName, columns: ['id',  'firstName', 'lastName', 'userName', 'password']);
    List<UserModel> user = [];
    for (int i = 0; i < maps.length; i++) {
      user.add(UserModel.fromMap(maps[i]));
    }
    return user;
  }

  Future<int> add(UserModel userModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, userModel.toMap());
  }

  Future<int> update(UserModel userModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, userModel.toMap(),
        where: 'id = ?', whereArgs: [userModel.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}

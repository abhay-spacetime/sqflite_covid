import 'package:get/get.dart';
import 'package:sqlicrud_demo/database/model/user_controller.dart';
import 'package:sqlicrud_demo/screens/homeView/home_controller.dart';
import 'package:sqlicrud_demo/screens/homeView/home_page.dart';
import 'package:sqlicrud_demo/screens/loginView/login_page.dart';

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

  Future<bool?> selectUser(String username, String password) async {
    print("Select User");
    // print(user.password);

    List<UserModel> user = await getUser();
    var flag = false;
    user.forEach((element) {
      element.userName.toString() == username &&
              element.password.toString() == password
          ? flag = true
          : print(element.userName + element.password);
    });

   
    if (flag ==true) {
      Get.put(HomeController());
      Get.find<HomeController>().fetchFromSQLite();
      Get.toNamed(HomePage.id);
    } else {
      Get.defaultDialog(title: 'Invalid you id');
      Get.toNamed(LoginPage.id);
    }
  }
}

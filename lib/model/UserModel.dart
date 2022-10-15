class UserModel {
  int? id;
  String firstName;
  String lastName;
  String userName;
  String password;

 UserModel({this.id, required this.firstName,required this.lastName,required this.userName,required this.password,});

  factory UserModel.fromMap(Map<dynamic, dynamic> json) {
    return UserModel(
      id: json['id'],
    firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      password: json['password'],
      );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'password': password,
       };
  }
}

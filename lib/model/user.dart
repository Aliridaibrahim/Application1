class UserModel {

  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";


  String email;
  String password;
  String phone;
  String uid;
  String displayName;
  UserModel();

  UserModel.fromMap(Map<String, dynamic> data) {
    email = data['email'];
    password = data['password'];
    phone = data['phone'];
    uid = data['uid'];
    displayName = data['displayName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'phone': phone,
      'uid':uid,
      'displayName':displayName,
    };
  }
}

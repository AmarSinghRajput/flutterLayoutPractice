
class Validations {
  static bool isValidUsername(String name) {
    return name != "" ? true : false;
  }

  static bool isValidPassword(String password) {
    return password.length > 7 ? true : false;
  }
}
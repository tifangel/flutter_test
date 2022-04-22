class Validator {
  static RegExp validatorEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp validatorPassword =
      RegExp(r"^(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d\w\W]{6,}$");
}

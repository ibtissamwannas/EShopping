class AppLinkApi {
  static const String server = "http://localhost/ecommerce";
  static const String test = "${server}/test.php";
  // signup
  static const String signUp = "${server}/auth/signup.php";
  static const String verifyCode = "${server}/auth/verifycode.php";
  static const String logIn = "${server}/auth/login.php";

  //forgetpassword
  static const String checkEmail = "${server}/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "${server}/forgetpassword/verifycode.php";
  static const String resetPassword =
      "${server}/forgetpassword/resetpassword.php";
}

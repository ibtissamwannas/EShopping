class AppLinkApi {
  //http://localhost/ecommerce
  //http://ecommerce245.000webhostapp.com
  static const String server = "http://localhost:8888/ecommerce";
  //images
  static const String imagesLinkStatic =
      "http://localhost:8888/ecommerce/upload";
  static const String categoriesImages = "$imagesLinkStatic/categories";
  static const String itemsImages = "$imagesLinkStatic/items";
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
  //home
  static const String homepage = "$server/home.php";
}

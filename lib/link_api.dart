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
  static const String resendCode = "${server}/auth/resend.php";
  //forgetpassword
  static const String checkEmail = "${server}/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "${server}/forgetpassword/verifycode.php";
  static const String resetPassword =
      "${server}/forgetpassword/resetpassword.php";
  //home
  static const String homepage = "$server/home.php";

  //items
  static const String items = "$server/items/items.php";

  //add favorite
  static const String addFavorite = "$server/favorite/add.php";

  //remove favorite
  static const String removeFavorite = "$server/favorite/remove.php";

  //ALL favorite
  static const String allFavorite = "$server/favorite/favoriteview.php";

  //cart View
  static const String cartView = "$server/cart/view.php";

  //cart add
  static const String cartAdd = "$server/cart/add.php";

  //cart remove
  static const String cardRemove = "$server/cart/remove.php";

  //cart get count
  static const String getCount = "$server/cart/getcountitems.php";

  //search
  static const String search = "$server/items/search.php";
}

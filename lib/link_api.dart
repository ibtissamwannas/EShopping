class AppLinkApi {
  //http://localhost/ecommerce
  //http://ecommerce245.000webhostapp.com
  static const String server = "http://10.0.2.2:8888/ecommerce";
  //images
  static const String imagesLinkStatic =
      "http://10.0.2.2:8888/ecommerce/upload";
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

  //view_address
  static const String viewAddress = "$server/address/view.php";

  //add_address
  static const String addAddress = "$server/address/add.php";

  //delete_address
  static const String deleteAddress = "$server/address/remove.php";

  //edit_address
  static const String editAddress = "$server/address/edit.php";

  //coupon
  static const String checkCoupon = "$server/coupon/check_coupon.php";

  //checkout
  static const String checkout = "$server/coupon/check_coupon.php";

  //checkoutadd
  static const String checkoutOrder = "$server/orders/add.php";

  //allorders
  static const String allorders = "$server/orders/allorders.php";

  //archieve
  static const String archieveorders = "$server/orders/archieveorders.php";

  //notification
  static const String notificationApi = "$server/orders/notification.php";

  //details order
  static const String orderDetails = "$server/orders/details.php";

  //details delete
  static const String deleteOrder = "$server/orders/delete.php";

  //details pending
  static const String pendingOrders = "$server/orders/pending.php";
}

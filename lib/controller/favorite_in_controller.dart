import 'package:get/get.dart';
import 'package:e_shopping/core/services/my_services.dart';
import '../../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/favorite.dart';

abstract class FavoriteInController extends GetxController {
  setFavorite(id, val);
}

class FavoriteControllerImp extends FavoriteInController {
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  Map isFavorite = {};

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(itemId) async {
    var response = await favoriteData.addFavoriteData(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavorite(itemId) async {
    var response = await favoriteData.removeFavoriteData(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}

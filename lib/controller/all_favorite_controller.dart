import 'package:e_shopping/data/model/favorite_model.dart';
import 'package:get/get.dart';
import 'package:e_shopping/core/services/my_services.dart';
import '../../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/all_favorite_data.dart';
import '../data/datasource/remote/favorite.dart';

abstract class allFavoriteController extends GetxController {
  getAllFavorite();
  removeFavorite(itemId);
}

class allFavoriteControllerImp extends allFavoriteController {
  MyServices myServices = Get.find();
  AllFavoriteData allfavoriteData = AllFavoriteData(Get.find());
  List<FavoriteModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteData favoriteData = FavoriteData(Get.find());

  getAllFavorite() async {
    var response = await allfavoriteData.getData(
      myServices.sharedPreferences.getInt("id").toString(),
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List resposeData = response["data"];
        data.addAll(
          resposeData.map(
            (e) => FavoriteModel.fromJson(
              e,
            ),
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavorite(itemId) async {
    // data.clear();
    var response = await favoriteData.removeFavoriteData(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.removeWhere(
          (element) => element.favoriteItemid == itemId,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    print("innnnnnnnnnn");
    getAllFavorite();

    super.onInit();
  }
}

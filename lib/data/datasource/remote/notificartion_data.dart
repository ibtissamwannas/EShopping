import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  NotificationDataFunc(
    String userId,
  ) async {
    var response = await crud.postData(AppLinkApi.notificationApi, {
      'user_id': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}

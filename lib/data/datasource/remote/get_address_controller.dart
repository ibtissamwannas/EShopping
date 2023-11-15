import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getAddressData(String userId) async {
    var response =
        await crud.postData(AppLinkApi.viewAddress, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }

  editAddressData(String id) async {
    var response = await crud.postData(AppLinkApi.editAddress, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteAddressData(String id) async {
    var response = await crud.postData(AppLinkApi.deleteAddress, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  addAddressData(String userId, String name, String city, String street,
      String lat, String long) async {
    var response = await crud.postData(AppLinkApi.addAddress, {
      "user_id": userId,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "lon": long,
    });
    return response.fold((l) => l, (r) => r);
  }
}

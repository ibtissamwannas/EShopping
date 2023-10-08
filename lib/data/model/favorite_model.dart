class FavoriteModel {
  int? favoriteId;
  int? favoriteUserid;
  int? favoriteItemid;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemTotal;
  int? itemIsActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemTake;
  int? itemCategoryId;
  int? usersId;

  FavoriteModel(
      {this.favoriteId,
      this.favoriteUserid,
      this.favoriteItemid,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemTotal,
      this.itemIsActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemTake,
      this.itemCategoryId,
      this.usersId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteItemid = json['favorite_itemid'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemTotal = json['item_total'];
    itemIsActive = json['item_is_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemTake = json['item_take'];
    itemCategoryId = json['item_category_id'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_itemid'] = this.favoriteItemid;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_desc'] = this.itemDesc;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_image'] = this.itemImage;
    data['item_total'] = this.itemTotal;
    data['item_is_active'] = this.itemIsActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_take'] = this.itemTake;
    data['item_category_id'] = this.itemCategoryId;
    data['users_id'] = this.usersId;
    return data;
  }
}
